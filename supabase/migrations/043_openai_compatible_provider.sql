-- Self-hosted/OpenAI-compatible chat providers (for example Ollama).
ALTER TABLE ai_configs DROP CONSTRAINT IF EXISTS ai_configs_provider_check;
ALTER TABLE ai_configs
  ADD CONSTRAINT ai_configs_provider_check
  CHECK (provider IN ('openai', 'anthropic', 'openai_compatible'));

ALTER TABLE ai_configs ADD COLUMN IF NOT EXISTS base_url text;
ALTER TABLE ai_configs ALTER COLUMN api_key DROP NOT NULL;

ALTER TABLE ai_usage_log DROP CONSTRAINT IF EXISTS ai_usage_log_provider_check;
ALTER TABLE ai_usage_log
  ADD CONSTRAINT ai_usage_log_provider_check
  CHECK (provider IN ('openai', 'anthropic', 'openai_compatible'));
