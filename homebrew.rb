# Ensures a particular Homebrew tap has been "tapped"
#
# Homebrew "taps" are like a repository of formulae (instructions used by
# Homebrew to install software). This dep ensures a particular tap has been
# added to Homebrew.
dep 'homebrew tap', :tap_name do
  requires 'homebrew'

  # Retrieves a list of all existing (tapped) taps
  #
  # This function returns an array, where each element is a string containing
  # the name of a tap that is currently tapped.
  def taps
    shell!('brew tap').strip.lines.map(&:strip)
  end

  met? { taps.include? tap_name.to_s }
  meet do
    log_block "Tapping Homebrew tap '#{tap_name}'" do
      shell! 'brew', 'tap', tap_name.to_s
    end
  end
end

dep 'homebrew cask' do
  requires 'homebrew tap'.with 'caskroom/cask'
end

meta :cask do
  accepts_list_for :installs, :basename

  template do
    requires CaskHelper.manager_dep

    met? { installs.all? { |pkg| CaskHelper.has?(pkg) } }
    meet { CaskHelper.handle_install!(installs) }
  end
end

# A PkgHelper for managing Homebrew Cask packages
class CaskHelper < Babushka::BrewHelper
  class << self
    def pkg_cmd
      'brew cask'
    end

    def manager_dep
      'homebrew cask'
    end

    def pkg_type
      :cask
    end

    def manager_key
      :cask
    end

    # The default implementation uses "which pkg_binary" to check if
    # this package manager is present. Since Homebrew Cask is an add-on
    # to Homebrew, it's necessary to check if the relevant package is
    # installed in Homebrew.
    def present?
      Babushka::BrewHelper.has?('brew-cask')
    end

    # Delegate prefix to Homebrew helper
    def prefix
      Babushka::BrewHelper.prefix
    end

    # The place where Homebrew casks are installed.
    #
    # Currently this uses the default caskroom for Homebrew Cask, which
    # is "/opt/homebrew-cask/Caskroom".
    #
    # TODO: make this determine the real caskroom
    def caskroom
      '/usr/local/Caskroom'.p
    end

    # Don't require sudo when running homebrew cask.
    #
    # When run for the first time as an ordinary user, it will prompt once for
    # a sudo password so it can set up the caskroom as a user-writeable
    # directory.
    def should_sudo?
      false
    end

    private

    # Don't check versions
    def has_pkg?(pkg)
      all_versions_of(pkg).any?
    end

    def all_versions_of(pkg)
      pkg_name = pkg.respond_to?(:name) ? pkg.name : pkg
      Dir[installed_pkgs_path / pkg_name / '*'].map { |i| File.basename i.chomp('/') }.map(&:to_s)
    end

    # The default implementation is "brew cask update", but Homebrew
    # Cask doesn't have its own explicit "update" operation, it just
    # uses Homebrew's standard update.
    def pkg_update_command
      'brew update'
    end

    # Homebrew Cask can't install a particular version on the CLI,
    # so we need to remove the --version flag from the default
    # implementation.
    def cmdline_spec_for(pkg)
      pkg.name
    end

    # Homebrew Cask packages get installed in the "caskroom"
    def installed_pkgs_path
      caskroom
    end
  end
end

Babushka::PkgHelper.all_manager_keys << CaskHelper.manager_key
