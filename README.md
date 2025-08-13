# PAP Module UI Components

A comprehensive Flutter package containing core UI components used across PAP (Platform for Applications and Platforms) modules. This package provides a consistent design system and reusable components to ensure a unified user experience across all PAP applications.

## Features

- 🎨 **Consistent Design System** - Unified theming and styling across all components
- 🧩 **Modular Components** - Well-structured, reusable UI components
- 🎭 **Multiple Themes** - Support for theme switching and customization
- 📱 **Responsive Design** - Components that work across different screen sizes
- ⚡ **Performance Optimized** - Efficient rendering with shimmer loading states
- 🔧 **Developer Friendly** - Easy to use APIs with comprehensive documentation

## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  module_ui_components:
    path: ../packages/module_ui_components  # Adjust path as needed
```

Then run:

```bash
flutter pub get
```

## Getting Started

### 1. Setup App Theme

Wrap your app with the `AppTheme` provider to enable theming:

```dart
import 'package:flutter/material.dart';
import 'package:module_ui_components/module_ui_components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      appThemeData: ThemeV1(), // or ThemeV2()
      child: MaterialApp(
        title: 'PAP App',
        home: MyHomePage(),
      ),
    );
  }
}
```

### 2. Using Components

Once the theme is set up, you can use any PAP component:

```dart
import 'package:module_ui_components/module_ui_components.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PAPButton.primary(
            title: 'Click me',
            onTap: () => print('Button pressed!'),
          ),
          PAPCard.cardItem(
            title: 'Sample Card',
            subtitle: 'This is a sample card',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
```

## Core Components

### Buttons

The `PAPButton` component provides various button styles and states.

#### Basic Usage

```dart
// Primary filled button
PAPButton.primary(
  title: 'Save Changes',
  onTap: () => saveData(),
)

// Secondary outline button
PAPButton.secondary(
  title: 'Cancel',
  styleType: ButtonStyleType.outline,
  onTap: () => Navigator.pop(context),
)

// Icon button
PAPButton.icon(
  icon: Icons.settings,
  onTap: () => openSettings(),
)

// Button with icon and text
PAPButton.primary(
  title: 'Download',
  icon: Icons.download,
  iconPosition: IconPosition.left,
  onTap: () => downloadFile(),
)

// Disabled button
PAPButton.primary(
  title: 'Submit',
  isEnable: false,
  onTap: null,
)

// Loading button
PAPButton.primary(
  title: 'Processing...',
  isBusy: true,
  onTap: () => processData(),
)
```

#### Button Types
- `ButtonType.button` - Standard text button
- `ButtonType.icon` - Icon-only button
- `ButtonType.animated` - Button with animated icon
- `ButtonType.popup` - Button with popup menu

#### Button Styles
- `ButtonStyleType.fill` - Filled background
- `ButtonStyleType.outline` - Outlined border
- `ButtonStyleType.plain` - No background or border

#### Button Sizes
- `ButtonSize.medium` - Standard size (32px height)
- `ButtonSize.small` - Compact size (24px height)

### Cards

The `PAPCard` component displays content in various card layouts.

#### Basic Usage

```dart
// Simple card
PAPCard.cardItem(
  title: 'Project Name',
  subtitle: 'Created: 21/05/06',
  description: 'Project description goes here...',
  isSelected: false,
  onTap: () => openProject(),
)

// Card with actions
PAPCard.cardItem(
  title: 'Document',
  subtitle: 'Last modified: Today',
  isSelected: true,
  actions: [
    ContextMenuAction(
      title: 'Edit',
      icon: Icons.edit,
      onTap: () => editDocument(),
    ),
    ContextMenuAction(
      title: 'Delete',
      icon: Icons.delete,
      itemStyle: ContextMenuItemStyle.error,
      onTap: () => deleteDocument(),
    ),
  ],
)

// List item style
PAPCard.listItem(
  title: 'List Item',
  subtitle: 'Subtitle text',
  isSelected: false,
)

// Image card
PAPCard.imageCard(
  title: 'Image Card',
  imagePath: 'assets/images/sample.png',
  isSelected: false,
)

// Draggable card
PAPCard.draggableCard<String>(
  title: 'Draggable Item',
  draggableData: 'item_id',
  onDragStarted: () => print('Drag started'),
  onDragEnd: () => print('Drag ended'),
)
```

### Text Input

The `PAPTextInput` component provides text input functionality with validation.

#### Basic Usage

```dart
final TextEditingController _controller = TextEditingController();

// Basic text input
PAPTextInput.plain(
  controller: _controller,
  label: 'Name',
  submitKeyType: SubmitKeyType.enter,
  onChanged: (value) => print('Text changed: $value'),
)

// Text input with validation
PAPTextInput.plain(
  controller: _controller,
  label: 'Email',
  submitKeyType: SubmitKeyType.enter,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Invalid email format';
    }
    return null;
  },
  onValidateChanged: (isValid) => print('Valid: $isValid'),
)

// Multiline text input
PAPTextInput.plain(
  controller: _controller,
  label: 'Description',
  isMultiline: true,
  maxCharacterLimit: 500,
  submitKeyType: SubmitKeyType.ctrlEnter,
)

// Text input with icon
PAPTextInput.plain(
  controller: _controller,
  label: 'Password',
  obscureText: true,
  icon: Icons.visibility,
  iconPosition: PAPTextInputIconPosition.right,
  onIconTap: () => togglePasswordVisibility(),
)
```

### Numeric Input

The `PAPNumericInput` component provides numeric input with increment/decrement controls.

#### Basic Usage

```dart
final TextEditingController _numController = TextEditingController();

// Basic numeric input
PAPNumericInput.plain(
  controller: _numController,
  label: 'Quantity',
  onChanged: (value) => print('Value: $value'),
)

// Numeric input with range
PAPNumericInput.plain(
  controller: _numController,
  label: 'Age',
  minValue: 0,
  maxValue: 120,
  onChanged: (value) => updateAge(value),
)
```

### Dropdown

The `PAPDropDown` component provides dropdown selection functionality.

#### Basic Usage

```dart
PAPDropDown(
  items: [
    PAPDropDownItem(
      title: 'Option 1',
      subtitle: 'First option',
      onTap: () => selectOption(1),
    ),
    PAPDropDownItem(
      title: 'Option 2',
      subtitle: 'Second option',
      isSelected: true,
      onTap: () => selectOption(2),
    ),
  ],
  onChanged: (index) => print('Selected index: $index'),
)
```

### Segment Control

The `PAPSegment` component provides segmented control functionality.

#### Basic Usage

```dart
PAPSegment.normal(
  items: [
    SegmentItemData.text(
      title: 'Tab 1',
      isSelected: true,
      onTap: () => switchToTab(0),
    ),
    SegmentItemData.text(
      title: 'Tab 2',
      isSelected: false,
      onTap: () => switchToTab(1),
    ),
  ],
)
```

### Other Components

- **PAPStepper** - Step-by-step navigation
- **PAPContextMenu** - Context menu functionality
- **PAPLoading** - Loading animations
- **PAPText** - Styled text display
- **PAPDivider** - Visual separators
- **PAPToastManager** - Toast notifications

## Theming System

The package supports multiple themes and easy customization.

### Available Themes

- **ThemeV1** - Classic PAP theme
- **ThemeV2** - Modern PAP theme

### Accessing Theme Data

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context).theme;
    
    return Container(
      color: theme.colors.primaryBackground,
      child: Text(
        'Themed text',
        style: theme.typographies.body1,
      ),
    );
  }
}
```

## Component Styles

All components support consistent styling through the `PapComponentStyle` enum:

- `PapComponentStyle.primary` - Primary brand color
- `PapComponentStyle.secondary` - Secondary color
- `PapComponentStyle.error` - Error/danger color
- `PapComponentStyle.warning` - Warning color  
- `PapComponentStyle.success` - Success color

## Shimmer Loading States

Most components support shimmer loading states for better UX during data loading:

```dart
// Button with shimmer
PAPButton.shimmerPrimary()

// Card with shimmer
PAPCard.shimmerCard()

// Segment with shimmer
PAPSegment.shimmer(
  items: placeholderItems,
  segmentSize: PAPSegmentSize.normal,
)
```

## Best Practices

### 1. Theme Consistency
Always use the theme system for colors, typography, and spacing.

### 2. Component State Management
Use proper state management for interactive components with loading states.

### 3. Accessibility
Components are built with accessibility in mind with automatic semantic labels.

### 4. Performance
Use shimmer states and proper widget lifecycle management.

## Examples

For complete working examples, check the showcase files in the example app:

- `button_showcase.dart` - Button examples
- `card_showcase.dart` - Card examples  
- `dropdown_showcase.dart` - Dropdown examples
- `textfield_showcase.dart` - Text input examples
- And more...

## Dependencies

This package uses the following key dependencies:

- `flutter` - Flutter SDK
- `dropdown_button2` - Enhanced dropdown functionality
- `custom_pop_up_menu` - Custom popup menus
- `loading_indicator` - Loading animations
- `flash` - Toast notifications
- `shimmer` - Shimmer loading effects
- `rive` - Animated icons

## Contributing

When contributing to this package:

1. Follow the existing code style and patterns
2. Add proper documentation for new components
3. Include examples in the showcase app
4. Ensure theme consistency
5. Add tests for new functionality

## License

This package is part of the PAP ecosystem and follows the project's licensing terms.

---

For more information and advanced usage examples, refer to the showcase application included in this package.