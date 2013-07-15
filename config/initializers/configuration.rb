$configuration = YAML.load(File.read(File.expand_path('config/site_settings.yml', Rails.root)))
if $configuration[Rails.env].is_a?(Hash)
  $configuration = $configuration[Rails.env].merge!($configuration['all'])
else
  $configuration = $configuration['all'] if $configuration['all'].is_a?(Hash)
end
$configuration ||= {} # if there were no settings for the loaded environment, give an empty hash so nobody tries to access nil's []
