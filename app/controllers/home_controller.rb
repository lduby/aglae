class HomeController < ApplicationController
  def index
    @openings = Array.new
    if Aglae::Application.config.toy_library_openings_mon_am != "" 
      if Aglae::Application.config.toy_library_openings_mon_pm != ""
        @openings << "Lundi: "+Aglae::Application.config.toy_library_openings_mon_am.to_s + " - " + Aglae::Application.config.toy_library_openings_mon_pm
      else 
        @openings << "Lundi: "+Aglae::Application.config.toy_library_openings_mon_am.to_s
      end
    else 
      if Aglae::Application.config.toy_library_openings_mon_pm != ""
        @openings << "Lundi: "+Aglae::Application.config.toy_library_openings_mon_pm.to_s
      end
    end
    if Aglae::Application.config.toy_library_openings_tue_am != "" 
      if Aglae::Application.config.toy_library_openings_tue_pm != ""
        @openings << "Mardi: "+Aglae::Application.config.toy_library_openings_tue_am.to_s + " - " + Aglae::Application.config.toy_library_openings_tue_pm
      else 
        @openings << "Mardi: "+Aglae::Application.config.toy_library_openings_tue_am.to_s
      end
    else 
      if Aglae::Application.config.toy_library_openings_tue_pm != ""
        @openings << "Mardi: "+Aglae::Application.config.toy_library_openings_tue_pm.to_s
      end
    end
    if Aglae::Application.config.toy_library_openings_wed_am != "" 
      if Aglae::Application.config.toy_library_openings_wed_pm != ""
        @openings << "Mercredi: "+Aglae::Application.config.toy_library_openings_wed_am.to_s + " - " + Aglae::Application.config.toy_library_openings_wed_pm
      else 
        @openings << "Mercredi: "+Aglae::Application.config.toy_library_openings_wed_am.to_s
      end
    else 
      if Aglae::Application.config.toy_library_openings_wed_pm != ""
        @openings << "Mercredi: "+Aglae::Application.config.toy_library_openings_wed_pm.to_s
      end
    end
    if Aglae::Application.config.toy_library_openings_thu_am != "" 
      if Aglae::Application.config.toy_library_openings_thu_pm != ""
        @openings << "Jeudi: "+Aglae::Application.config.toy_library_openings_thu_am.to_s + " - " + Aglae::Application.config.toy_library_openings_thu_pm
      else 
        @openings << "Jeudi: "+Aglae::Application.config.toy_library_openings_thu_am.to_s
      end
    else 
      if Aglae::Application.config.toy_library_openings_thu_pm != ""
        @openings << "Jeudi: "+Aglae::Application.config.toy_library_openings_thu_pm.to_s
      end
    end
    if Aglae::Application.config.toy_library_openings_fri_am != "" 
      if Aglae::Application.config.toy_library_openings_fri_pm != ""
        @openings << "Vendredi: "+Aglae::Application.config.toy_library_openings_fri_am.to_s + " - " + Aglae::Application.config.toy_library_openings_fri_pm
      else 
        @openings << "Vendredi: "+Aglae::Application.config.toy_library_openings_fri_am.to_s
      end
    else 
      if Aglae::Application.config.toy_library_openings_fri_pm != ""
        @openings << "Vendredi: "+Aglae::Application.config.toy_library_openings_fri_pm.to_s
      end
    end
    if Aglae::Application.config.toy_library_openings_sat_am != "" 
      if Aglae::Application.config.toy_library_openings_sat_pm != ""
        @openings << "Samedi: "+Aglae::Application.config.toy_library_openings_sat_am.to_s + " - " + Aglae::Application.config.toy_library_openings_sat_pm
      else 
        @openings << "Samedi: "+Aglae::Application.config.toy_library_openings_sat_am.to_s
      end
    else 
      if Aglae::Application.config.toy_library_openings_sat_pm != ""
        @openings << "Samedi: "+Aglae::Application.config.toy_library_openings_sat_pm.to_s
      end
    end
  end
end
