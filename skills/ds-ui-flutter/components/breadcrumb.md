# Breadcrumb

Displays the path to the current resource using a hierarchy of links.




```dart
class PrimaryBreadcrumb extends StatelessWidget {
  const PrimaryBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return DSBreadcrumb(
      children: [
        DSBreadcrumbLink(
          onPressed: () => print('Navigating to Home'),
          child: const Text('Home'),
        ),
        DSBreadcrumbDropdown(
          items: [
            DSBreadcrumbDropMenuItem(
              onPressed: () => print('Navigating to Documentation'),
              child: const Text('Documentation'),
            ),
            DSBreadcrumbDropMenuItem(
              onPressed: () => print('Navigating to Themes'),
              child: const Text('Themes'),
            ),
            DSBreadcrumbDropMenuItem(
              onPressed: () => print('Navigating to Github'),
              child: const Text('Github'),
            ),
          ],
          showDropdownArrow: false,
          child: DSBreadcrumbEllipsis(),
        ),
        Text('Components'),
        Text('Breadcrumb'),
      ],
    );
  }
}
```



## Custom separator

Use a custom `separator` to change the default `>` separator.



```dart
class CustomSeparatorBreadcrumb extends StatelessWidget {
  const CustomSeparatorBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return DSBreadcrumb(
      separator: const Icon(LucideIcons.slash),
      children: [
        DSBreadcrumbLink(
          onPressed: () => print('Navigating to Home'),
          child: const Text('Home'),
        ),
        DSBreadcrumbLink(
          onPressed: () => print('Navigating to Components'),
          child: const Text('Components'),
        ),
        Text('Breadcrumb'),
      ],
    );
  }
}
```




## Dropdown

You can use `DSBreadcrumbDropdown` to create a dropdown in the breadcrumb.



```dart
class DropdownBreadcrumb extends StatelessWidget {
  const DropdownBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return DSBreadcrumb(
      children: [
        DSBreadcrumbLink(
          onPressed: () => print('Navigating to Home'),
          child: const Text('Home'),
        ),
        DSBreadcrumbDropdown(
          items: [
            DSBreadcrumbDropMenuItem(
              onPressed: () => print('Navigating to Documentation'),
              child: const Text('Documentation'),
            ),
            DSBreadcrumbDropMenuItem(
              onPressed: () => print('Navigating to Themes'),
              child: const Text('Themes'),
            ),
            DSBreadcrumbDropMenuItem(
              onPressed: () => print('Navigating to Github'),
              child: const Text('Github'),
            ),
          ],
          child: const Text('Components'),
        ),
        Text('Breadcrumb'),
      ],
    );
  }
}
```

## Example
```dart
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import '../common/base_scaffold.dart';

class BreadcrumbPage extends StatelessWidget {
  const BreadcrumbPage({super.key});

  void _navigateToHome() {
    print('Navigating to Home');
  }

  void _navigateToComponents() {
    print('Navigating to Components');
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Breadcrumb',
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Simple Breadcrumb',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const DSBreadcrumb(
          children: [
            Text('Home'),
            Text('Library'),
            Text('Data'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Breadcrumb with Links',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        DSBreadcrumb(
          children: [
            DSBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            DSBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Components'),
            ),
            const Text('Breadcrumb'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Breadcrumb with Ellipsis',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        DSBreadcrumb(
          children: [
            DSBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            const DSBreadcrumbEllipsis(),
            DSBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Components'),
            ),
            const Text('Breadcrumb'),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Custom Separator',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        DSBreadcrumb(
          separator: const Icon(LucideIcons.slash),
          children: [
            DSBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            DSBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Components'),
            ),
            const Text('Breadcrumb'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Breadcrumb with Dropdown',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        DSBreadcrumb(
          children: [
            DSBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            DSBreadcrumbDropdown(
              items: [
                DSBreadcrumbDropMenuItem(
                  onPressed: () => print('Navigating to Documentation'),
                  child: const Text('Documentation'),
                ),
                DSBreadcrumbDropMenuItem(
                  onPressed: () => print('Navigating to Themes'),
                  child: const Text('Themes'),
                ),
                DSBreadcrumbDropMenuItem(
                  onPressed: () => print('Navigating to Github'),
                  child: const Text('Github'),
                ),
              ],
              child: const Text('Components'),
            ),
            Text('Breadcrumb'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Long Breadcrumb',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        DSBreadcrumb(
          children: [
            DSBreadcrumbLink(
              onPressed: _navigateToHome,
              child: const Text('Home'),
            ),
            DSBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Component 1'),
            ),
            DSBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Component 2'),
            ),
            DSBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Component 3'),
            ),
            DSBreadcrumbLink(
              onPressed: _navigateToComponents,
              child: const Text('Component 4'),
            ),
            Text('Breadcrumb'),
          ],
        ),
      ],
    );
  }
}

```
