# Files

*Note*: if any of th files/folders is mentioned without a comment after it, means they should be moved unchanged. But if there is a comment, changes are explained.

## Package level (`src/packages/pap_ui_kit`)
- **assets/**
  - `font_icons/` --> should not be moved (Internal font icons)
  - `fonts/`--> should not be moved (Internal fonts)

- **lib/**
  - `helpers/`
    - `decoration_helper.dart`
    - `dialog_helper.dart`
    - `enum_helper.dart`
    - `toaster_helper.dart`
  - `src/`
    - `themes/**` --> should not be moved (Internal theme and colors)
  - `theme/`
    - `app_theme/`
      - `app_theme_data.dart`
      - `colors.dart`
      - `icons.dart`
      - `theme.dart`
      - `typographies.dart`
    - `app_theme.dart`
    - `theme_provider.dart` --> should not be moved, tied to Theme_V1 and Theme_V2
  - `widgets/`
    - `bases/`
      - `bases.dart`
      - `stateful_shimmer_widget.dart`
      - `stateless_shimmer_widget.dart`
    - `pap_appbar.dart`
    - `pap_badge.dart`
    - `pap_bread_crumb/`
      - `bread_crumb_base.dart`
      - `pap_bread_crumb.dart`
    - `pap_button.dart`
    - `pap_card/`
      - `action_card.dart`
      - `card_body.dart`
      - `draggable_card.dart`
      - `image_card.dart`
      - `inline_card_item.dart`
      - `list_item_with_handler_body.dart`
      - `pap_card.dart`
    - `pap_check_box.dart`
    - `pap_color_box.dart`
    - `pap_context_menu/`
      - `pap_context_menu.dart`
      - `pap_context_menu_divider.dart`
      - `pap_context_menu_item.dart`
    - `pap_dialog.dart`
    - `pap_divider.dart`
    - `pap_group_box.dart`
    - `pap_hero.dart`
    - `pap_icon_box.dart`
    - `pap_loading.dart`
    - `pap_navigation.dart`
    - `pap_navigation_item.dart`
    - `pap_numeric_input.dart`
    - `pap_popup_button.dart`
    - `pap_progressive_menu.dart`
    - `pap_radio_selection_list.dart`
    - `pap_segment.dart`
    - `pap_single_select.dart`
    - `pap_switch.dart`
    - `pap_text.dart`
    - `pap_text_input.dart`
    - `pap_toast_manager/`
      - `pap_toast_manager.dart`
      - `pap_toast_overlay.dart`
    - `pap_toolbox.dart`
    - `pap_dropdown.dart`

## Project level (`src/`)
- **views/**
  - `showcase/`
  - `home_page/`
    is moved but with the adjustments of removing the theme switching logic. it would be a simple widget that builds the `Showcase` widget
    
- **widgets/**
  - `frame.dart`
  - `numeric_showcase.dart`
  - `select_list_showcase.dart`
  - `single_select.dart`
  - `textfield_showcase.dart`

    These ones move because of the layout of showcase stays the same in this package, and also is reusable in `ui_kit` 

- Also a neutral implementation of `IAppThemeData` is needed that uses Material colors/icons and is the default Theme for the widgets here.