require 'httparty'
require 'json'

class SiriProxy::Plugin::Macintosh < SiriProxy::Plugin
  attr_accessor :host
  
  def initialize(config = {})
  
  end

#### FRENCH SPEAKING REQUIRED, BUT YOU CAN CHANGE IT AS WELL ####  

#mac control
  listen_for(/mac.*redemarrer/i) { set_mac_restart }
  listen_for(/redemarrer.*mac/i) { set_mac_restart }
  listen_for(/session.*mac/i) { set_mac_logout }
  listen_for(/mac.*session/i) { set_mac_logout }
  listen_for(/veille.*macintosh/i) { set_mac_sleep }
  listen_for(/mac.*veille/i) { set_mac_sleep }
 

#iTunes control
 listen_for(/fermer.*itunes/i) { kill_iTunes }
  listen_for(/itunes.*fermer/i) { kill_iTunes }
  listen_for(/mac.*suivant/i) { itunes_next }
   listen_for(/mac.*precedend/i) { itunes_prev }
   listen_for(/mac.*pause/i) { itunes_pause }
    listen_for(/mac.*play/i) { itunes_play }

  
  #Applications
  


	def set_mac_sleep
	say "Mise en veille de votre Mac"

	system("/usr/bin/osascript -e 'tell application \"System Events\" to sleep'");
	end

	def set_mac_restart
	say "Redemarrage de votre Mac"

	system("/usr/bin/osascript -e 'tell application \"System Events\" to sleep'");
	end
	
	def set_mac_logout
	say "Fermeture de la session en cours"
	
	system("osascript -e 'tell application \"System Events\" to log out'");
	end

##### ITUNES CONTROL ###

	def kill_iTunes
	say "Fermeture d'iTunes"
	
	system("osascript -e 'tell application \"iTunes\" to quit'");
	end

    def itunes_next
    
    system("osascript -e 'tell application \"iTunes\" to next track'");

    end
    def itunes_prev
    
    system("osascript -e 'tell application \"iTunes\" to previous track'");
    
    end
    def itunes_pause
    
    system("osascript -e 'tell application \"iTunes\" to pause'");
    
    end
    def itunes_play
    
    system("osascript -e 'tell application \"iTunes\" to play'");
    
    end
    
####### END ###
    
end