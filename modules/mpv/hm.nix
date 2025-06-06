{ mkTarget, lib, ... }:
mkTarget {
  name = "mpv";
  humanName = "mpv";
  configElements = [
    (
      { fonts }:
      {
        programs.mpv.config = {
          osd-font = fonts.sansSerif.name;
          sub-font = fonts.sansSerif.name;
        };
      }
    )
    (
      { colors }:
      {
        programs.mpv = {
          config = with colors.withHashtag; {
            background-color = "#000000";
            osd-back-color = base01;
            osd-border-color = base01;
            osd-color = base05;
            osd-shadow-color = base00;
          };

          scriptOpts = {
            uosc.color =
              with colors;
              lib.concatMapAttrsStringSep "," (name: value: "${name}=${value}") {
                background = base00;
                background_text = base05;
                foreground = base05;
                foreground_text = base00;
                success = base0B;
                error = base08;
              };

            modernz = with colors.withHashtag; {
              seekbarfg_color = base0D;
              seekbarbg_color = base03;
              seekbar_cache_color = base03;
              window_title_color = base03;
              window_controls_color = base03;

              title_color = base05;
              time_color = base05;
              chapter_title_color = base05;
              cache_info_color = base05;

              middle_buttons_color = base0D;
              side_buttons_color = base03;
              playpause_color = base0D;
              hover_effect_color = base0E;
            };
          };
        };
      }
    )
  ];
}
