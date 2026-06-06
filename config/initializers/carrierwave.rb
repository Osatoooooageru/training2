CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  # Windows環境でパーミッションエラーを防ぐ設定
  config.storage = :file
end
