def cask_group(name)
  @group_casks = []
  yield
  cask(name) do
    @group_casks.each do |cask|
      requires(cask)
    end
  end
end

def cask(name)
  cask_name = "#{name}.cask"
  dep(cask_name)
  @group_casks << cask_name if @group_casks.is_a?(Array)
end

cask_group 'Cloud Apps' do
  cask 'dropbox'
  cask 'google-drive'
end

cask_group 'Browsers' do
  cask 'google-chrome'
  cask 'firefox'
end

cask_group 'System Utilities' do
  cask 'alfred'
  cask 'bartender'
  cask 'boom'
  cask 'cleanmymac'
end

cask_group 'CLI Utilities' do
  cask 'dayone-cli'
end

cask_group 'Image Processing' do
  cask 'imageoptim'
  cask 'imagealpha'
end

cask_group 'Documents Processing' do
  cask 'devonthink-pro'
end

cask_group 'Development Utilities' do
  cask 'emacs'
end

cask_group 'Fonts' do
  cask 'font-droid-serif'
  cask 'font-droid-sans'
  cask 'font-fira-code'
  cask 'font-fira-mono'
  cask 'font-fira-sans'
  cask 'font-fontawesome'
end
