# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'associations' do
    it { should belong_to(:message) }
    it { should have_one_attached(:attachment) }
    it { should have_many(:chunks).dependent(:destroy) }
  end

  describe 'callbacks' do
    let(:document) { build(:document) }

    it 'calls #chunk_attachment after commit on create' do
      expect(document).to receive(:chunk_attachment)
      document.save!
    end

    it 'calls #chunk_attachment after commit on update' do
      document.save!
      expect(document).to receive(:chunk_attachment)
      document.update!(updated_at: Time.now)
    end
  end

  describe 'chunk_attachment' do
    let(:document) { create(:document) }
    let(:content) { 'a' * 5000 }
    let(:chunk_size) { Document::CHUNK_SIZE }

    before do
      document.attachment.attach(
        io: StringIO.new(content),
        filename: 'test.txt',
        content_type: 'text/plain'
      )
    end

    it 'creates chunks of appropriate size after the document is created' do
      expect(document.chunks.count).to eq((content.size.to_f / chunk_size).ceil)
    end

    it 'creates chunks with correct content' do
      document.send(:chunk_attachment)

      document.chunks.each_with_index do |chunk, index|
        start_index = index * chunk_size
        end_index = [start_index + chunk_size, content.size].min
        expect(chunk.content).to eq(content[start_index...end_index])
      end
    end

    it 'does not create chunks if already present' do
      expect { document.send(:chunk_attachment) }.not_to(change { document.chunks.count })
    end

    it 'does not create chunks if attachment is not present' do
      document.attachment.detach
      document.chunks.destroy_all
      expect(document.chunks).to be_empty
      expect { document.send(:chunk_attachment) }.not_to(change { document.chunks.count })
    end
  end
end
