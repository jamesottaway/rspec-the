Dir.chdir 'spec' do
  Dir.glob('support/**/*.rb').each do |file|
    require file
  end
end
