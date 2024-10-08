# frozen_string_literal: true

module LLM::Info
  KNOWN_MODELS = [
    # Semantics of fields:
    # - canonical_name (required): A string that uniquely identifies the model.
    #   We use this string as the public identifier when users choose this model via the API.
    #
    # - client_alias (optional): An override string that should be used by the client to uniquely identify this model via its API.
    #   If not provided, the canonical_name is used.
    #
    # - display_name (required): A string that is displayed to the user when choosing this model via the UI.
    #
    # - provider (required): The provider of the model. This is used to determine which client to use when
    #   interacting with the model.
    #
    # - context_window_tokens (required): The number of input tokens that the model can process at once.
    #
    # - client_class (optional): The class of the client to use when interacting with the model.
    #   If not provided, then the model will not be available to use for generation use (such as in test cases).

    # GPT-3.5 Turbo Models
    {
      canonical_name: 'gpt-3.5-turbo',
      display_name: 'GPT-3.5 Turbo',
      url_slug: 'gpt-3-5-turbo',
      provider_canonical_name: :openai,
      context_window_tokens: 4096,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-3.5-turbo',
      cents_per_thousand_input_tokenization_units: '0.05',
      cents_per_thousand_output_tokenization_units: '0.15',
      supports_streaming: true,
      release_date: '2022-11-28',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-3.5-turbo-0125',
      display_name: 'GPT-3.5 Turbo 0125',
      url_slug: 'gpt-3-5-turbo-0125',
      provider_canonical_name: :openai,
      context_window_tokens: 16_385,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-3.5-turbo',
      cents_per_thousand_input_tokenization_units: '0.05',
      cents_per_thousand_output_tokenization_units: '0.15',
      supports_streaming: true,
      release_date: '2024-01-25',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-3.5-turbo-16k',
      display_name: 'GPT-3.5 Turbo 16K',
      url_slug: 'gpt-3-5-turbo-16k',
      provider_canonical_name: :openai,
      context_window_tokens: 16_384,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-3.5-turbo',
      cents_per_thousand_input_tokenization_units: '0.3',
      cents_per_thousand_output_tokenization_units: '0.4',
      supports_streaming: true,
      release_date: '2023-06-13',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 16_384 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-3.5-turbo-1106',
      display_name: 'GPT-3.5 Turbo 1106',
      url_slug: 'gpt-3-5-turbo-1106',
      provider_canonical_name: :openai,
      context_window_tokens: 16_385,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-3.5-turbo',
      cents_per_thousand_input_tokenization_units: '0.1',
      cents_per_thousand_output_tokenization_units: '0.2',
      supports_streaming: true,
      release_date: '2023-11-06',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 16_384 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },

    # GPT-4 Models
    {
      canonical_name: 'gpt-4',
      display_name: 'GPT-4',
      url_slug: 'gpt-4',
      provider_canonical_name: :openai,
      context_window_tokens: 8_192,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '3',
      cents_per_thousand_output_tokenization_units: '6',
      supports_streaming: true,
      premium_model: true,
      release_date: '2023-03-14',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 8_192 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-4-32k',
      display_name: 'GPT-4 32K',
      url_slug: 'gpt-4-32k',
      provider_canonical_name: :openai,
      context_window_tokens: 32_768,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      release_date: '2023-03-14',
      cents_per_thousand_input_tokenization_units: '6',
      cents_per_thousand_output_tokenization_units: '12',
      premium_model: true
    },
    {
      canonical_name: 'gpt-4-1106-preview',
      display_name: 'GPT-4 Turbo 1106',
      url_slug: 'gpt-4-1106-preview',
      provider_canonical_name: :openai,
      context_window_tokens: 128_000,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '1',
      cents_per_thousand_output_tokenization_units: '3',
      supports_streaming: true,
      premium_model: true,
      release_date: '2023-11-06',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-4-turbo-2024-04-09',
      display_name: 'GPT-4 Turbo 2024-04-09',
      url_slug: 'gpt-4-turbo-2024-04-09',
      provider_canonical_name: :openai,
      context_window_tokens: 128_000,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '1',
      cents_per_thousand_output_tokenization_units: '3',
      supports_streaming: true,
      premium_model: true,
      release_date: '2024-04-09',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-4-0125-preview',
      display_name: 'GPT-4 Turbo 0125',
      url_slug: 'gpt-4-0125-preview',
      provider_canonical_name: :openai,
      context_window_tokens: 128_000,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '1',
      cents_per_thousand_output_tokenization_units: '3',
      supports_streaming: true,
      premium_model: true,
      release_date: '2024-01-25',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-4-turbo-preview',
      display_name: 'GPT-4 Turbo',
      url_slug: 'gpt-4-turbo-preview',
      provider_canonical_name: :openai,
      context_window_tokens: 128_000,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '1',
      cents_per_thousand_output_tokenization_units: '3',
      supports_streaming: true,
      premium_model: true,
      release_date: '2023-11-06',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-4-0613',
      display_name: 'GPT-4 0613',
      url_slug: 'gpt-4-0613',
      provider_canonical_name: :openai,
      context_window_tokens: 8_192,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '3',
      cents_per_thousand_output_tokenization_units: '6',
      supports_streaming: true,
      premium_model: true,
      release_date: '2023-06-13',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 8_192 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-4-32k-0613',
      display_name: 'GPT-4 32K 0613',
      url_slug: 'gpt-4-32k-0613',
      provider_canonical_name: :openai,
      context_window_tokens: 32_768,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '6',
      cents_per_thousand_output_tokenization_units: '12',
      release_date: '2023-06-13',
      premium_model: true
    },
    {
      canonical_name: 'gpt-4o',
      display_name: 'GPT-4o',
      url_slug: 'gpt-4o',
      supports_streaming: true,
      provider_canonical_name: :openai,
      context_window_tokens: 128_000,
      tokenization_unit: :tokens,
      client_class: LLMClients::OpenAi,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '0.5',
      cents_per_thousand_output_tokenization_units: '1.5',
      release_date: '2024-05-13',
      premium_model: true,
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 2_048 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-4o-mini',
      display_name: 'GPT-4o Mini',
      url_slug: 'gpt-4o-mini',
      supports_streaming: true,
      provider_canonical_name: :openai,
      context_window_tokens: 128_000,
      tokenization_unit: :tokens,
      client_class: LLMClients::OpenAi,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '0.015',
      cents_per_thousand_output_tokenization_units: '0.06',
      release_date: '2024-07-18',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 16_383 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },
    {
      canonical_name: 'gpt-4o-2024-05-13',
      display_name: 'GPT-4o 2024-05-13',
      url_slug: 'gpt-4o-2024-05-13',
      supports_streaming: true,
      provider_canonical_name: :openai,
      context_window_tokens: 128_000,
      client_class: LLMClients::OpenAi,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4',
      cents_per_thousand_input_tokenization_units: '0.5',
      cents_per_thousand_output_tokenization_units: '1.5',
      release_date: '2024-05-13',
      premium_model: true,
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 2_048 }),
        LLM::Validations::StopSequences.new,
        LLM::Validations::PresencePenalty.new({ min: 0.0, max: 2.0 }),
        LLM::Validations::FrequencyPenalty.new({ min: 0.0, max: 2.0 })
      ]
    },

    # Mistral Models
    {
      canonical_name: 'mistral-7b-instruct',
      client_alias: 'mistral.mistral-7b-instruct-v0:2',
      display_name: 'Mistral 7B Instruct',
      url_slug: 'mistral-7b-instruct',
      provider_canonical_name: :mistral,
      context_window_tokens: 32_000,
      client_class: LLMClients::AwsBedrock::Live,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4', # TODO: Is this right?
      cents_per_thousand_input_tokenization_units: '0.025',
      cents_per_thousand_output_tokenization_units: '0.025',
      release_date: '2023-09-27',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopK.new({ min: 0, max: 200 }, default: 50),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 8_192 }, default: 512),
        LLM::Validations::StopSequences.new
      ]
    },
    {
      canonical_name: 'mistral-8x7b-instruct',
      client_alias: 'mistral.mixtral-8x7b-instruct-v0:1',
      display_name: 'Mistral 8x7B Instruct',
      url_slug: 'mistral-8x7b-instruct',
      provider_canonical_name: :mistral,
      context_window_tokens: 32_000,
      client_class: LLMClients::AwsBedrock::Live,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4', # TODO: Is this right?
      cents_per_thousand_input_tokenization_units: '0.07',
      cents_per_thousand_output_tokenization_units: '0.07',
      release_date: '2023-12-11',
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopK.new({ min: 0, max: 200 }, default: 50),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }, default: 512),
        LLM::Validations::StopSequences.new
      ]
    },
    {
      canonical_name: 'mistral-large',
      client_alias: 'mistral.mistral-large-2402-v1:0',
      display_name: 'Mistral Large',
      url_slug: 'mistral-large',
      provider_canonical_name: :mistral,
      context_window_tokens: 32_000,
      client_class: LLMClients::AwsBedrock::Live,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4', # TODO: Is this right?
      cents_per_thousand_input_tokenization_units: '0.8',
      cents_per_thousand_output_tokenization_units: '0.8',
      release_date: '2024-02-26',
      premium_model: true,
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopK.new({ min: 0, max: 200 }, default: 50),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }, default: 512),
        LLM::Validations::StopSequences.new
      ]
    },

    # Anthropic Models
    {
      canonical_name: 'claude-3-opus-20240229',
      client_alias: 'claude-3-opus-20240229',
      display_name: 'Claude 3 Opus',
      url_slug: 'claude-3-opus',
      provider_canonical_name: :anthropic,
      context_window_tokens: 200_000,
      client_class: LLMClients::Anthropic,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4', # TODO: Is this right?
      cents_per_thousand_input_tokenization_units: '1.5',
      cents_per_thousand_output_tokenization_units: '7.5',
      release_date: '2024-03-04',
      premium_model: true,
      supports_streaming: true,
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopK.new({ min: 0, max: 100_000_000 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }, default: 1024)
      ]
    },
    {
      canonical_name: 'claude-3-sonnet-20240229',
      client_alias: 'claude-3-sonnet-20240229',
      display_name: 'Claude 3 Sonnet',
      url_slug: 'claude-3-sonnet',
      provider_canonical_name: :anthropic,
      context_window_tokens: 200_000,
      client_class: LLMClients::Anthropic,
      tokenization_unit: :tokens,
      supports_streaming: true,
      tiktoken_model: 'gpt-4', # TODO: Is this right?
      cents_per_thousand_input_tokenization_units: '0.3',
      cents_per_thousand_output_tokenization_units: '1.5',
      release_date: '2024-03-04',
      premium_model: true,
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopK.new({ min: 0, max: 100_000_000 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }, default: 1024)
      ]
    },
    {
      canonical_name: 'claude-3-haiku-20240307',
      client_alias: 'anthropic.claude-3-haiku-20240307-v1:0',
      display_name: 'Claude 3 Haiku',
      url_slug: 'claude-3-haiku',
      provider_canonical_name: :anthropic,
      context_window_tokens: 200_000,
      client_class: LLMClients::AwsBedrock::Live,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4', # TODO: Is this right?
      cents_per_thousand_input_tokenization_units: '0.025',
      cents_per_thousand_output_tokenization_units: '0.125',
      release_date: '2024-03-13',
      premium_model: true,
      supports_streaming: true,
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopK.new({ min: 0, max: 100_000_000 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }, default: 1024)
      ]
    },
    {
      canonical_name: 'claude-3.5-sonnet-20240620',
      client_alias: 'claude-3-5-sonnet-20240620',
      display_name: 'Claude 3.5 Sonnet',
      url_slug: 'claude-3-5-sonnet',
      provider_canonical_name: :anthropic,
      context_window_tokens: 200_000,
      client_class: LLMClients::Anthropic,
      tokenization_unit: :tokens,
      tiktoken_model: 'gpt-4', # TODO: Is this right?
      cents_per_thousand_input_tokenization_units: '0.3',
      cents_per_thousand_output_tokenization_units: '1.5',
      release_date: '2024-06-20',
      premium_model: true,
      supports_streaming: true,
      config_validation: [
        LLM::Validations::Temperature.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopP.new({ min: 0.0, max: 1.0 }),
        LLM::Validations::TopK.new({ min: 0, max: 100_000_000 }),
        LLM::Validations::MaxOutputTokens.new({ min: 1, max: 4_096 }, default: 1024)
      ]
    }
  ].freeze

  KNOWN_PROVIDERS = [
    {
      canonical_name: :openai,
      display_name: 'OpenAI'
    },
    {
      canonical_name: :google,
      display_name: 'Google'
    },
    {
      canonical_name: :anthropic,
      display_name: 'Anthropic'
    },
    {
      canonical_name: :mistral,
      display_name: 'Mistral'
    }
  ].freeze
end
