import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';

class IconButtonWithMenuUseCase extends StatefulWidget {
  const IconButtonWithMenuUseCase({super.key});

  @override
  State<IconButtonWithMenuUseCase> createState() => _IconButtonWithMenuUseCaseState();
}

class _IconButtonWithMenuUseCaseState extends State<IconButtonWithMenuUseCase> {
  final DSContextMenuController _menuController = DSContextMenuController();
  final DSContextMenuController _menuController2 = DSContextMenuController();
  final DSContextMenuController _menuController3 = DSContextMenuController();
  final DSContextMenuController _menuController4 = DSContextMenuController();

  @override
  void dispose() {
    _menuController.dispose();
    _menuController2.dispose();
    _menuController3.dispose();
    _menuController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IconButton com Menu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clique no ícone para ver as opções',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // IconButton com menu de contexto
            DSContextMenu(
              controller: _menuController,
              items: [
                DSContextMenuItem(
                  leading: const Icon(Icons.edit, size: 16),
                  onPressed: () {
                    _menuController.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Editar clicado!')),
                    );
                  },
                  child: const Text('Editar'),
                ),
                DSContextMenuItem(
                  leading: const Icon(Icons.delete, size: 16, color: Colors.red),
                  onPressed: () {
                    _menuController.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Deletar clicado!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  child: const Text('Deletar', style: TextStyle(color: Colors.red)),
                ),
              ],
              child: DSIconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  _menuController.show();
                },
              ),
            ),

            const SizedBox(height: 40),

            // Exemplo com menu mais complexo
            const Text(
              'Menu com submenu',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            DSContextMenu(
              controller: _menuController2,
              items: [
                DSContextMenuItem(
                  leading: const Icon(Icons.edit, size: 16),
                  onPressed: () {
                    _menuController2.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Editar clicado!')),
                    );
                  },
                  child: const Text('Editar'),
                ),
                DSContextMenuItem(
                  leading: const Icon(Icons.copy, size: 16),
                  onPressed: () {
                    _menuController2.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Copiar clicado!')),
                    );
                  },
                  child: const Text('Copiar'),
                ),
                DSContextMenuItem(
                  leading: const Icon(Icons.more_horiz, size: 16),
                  trailing: const Icon(Icons.chevron_right, size: 16),
                  items: [
                    DSContextMenuItem(
                      leading: const Icon(Icons.delete, size: 16, color: Colors.red),
                      onPressed: () {
                        _menuController2.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Deletar clicado!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                      child: const Text('Deletar', style: TextStyle(color: Colors.red)),
                    ),
                    DSContextMenuItem(
                      leading: const Icon(Icons.archive, size: 16),
                      onPressed: () {
                        _menuController2.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Arquivar clicado!')),
                        );
                      },
                      child: const Text('Arquivar'),
                    ),
                  ],
                  child: const Text('Mais opções'),
                ),
              ],
              child: DSIconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  _menuController2.show();
                },
              ),
            ),

            const SizedBox(height: 40),

            // Exemplo com diferentes estilos
            const Text(
              'Diferentes estilos',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton primário
                DSContextMenu(
                  controller: _menuController3,
                  items: [
                    DSContextMenuItem(
                      leading: const Icon(Icons.edit, size: 16),
                      onPressed: () {
                        _menuController3.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editar!')),
                        );
                      },
                      child: const Text('Editar'),
                    ),
                    DSContextMenuItem(
                      leading: const Icon(Icons.delete, size: 16, color: Colors.red),
                      onPressed: () {
                        _menuController3.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Deletar!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                      child: const Text('Deletar', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                  child: DSIconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      _menuController3.show();
                    },
                  ),
                ),

                const SizedBox(width: 16),

                // IconButton outline
                DSContextMenu(
                  controller: _menuController4,
                  items: [
                    DSContextMenuItem(
                      leading: const Icon(Icons.edit, size: 16),
                      onPressed: () {
                        _menuController4.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editar!')),
                        );
                      },
                      child: const Text('Editar'),
                    ),
                    DSContextMenuItem(
                      leading: const Icon(Icons.delete, size: 16, color: Colors.red),
                      onPressed: () {
                        _menuController4.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Deletar!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                      child: const Text('Deletar', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                  child: DSIconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      _menuController4.show();
                    },
                  ),
                ),

                const SizedBox(width: 16),

                // IconButton ghost
                DSContextMenuRegion(
                  items: [
                    DSContextMenuItem(
                      leading: const Icon(Icons.edit, size: 16),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editar!')),
                        );
                      },
                      child: const Text('Editar'),
                    ),
                    DSContextMenuItem(
                      leading: const Icon(Icons.delete, size: 16, color: Colors.red),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Deletar!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                      child: const Text('Deletar', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                  child: DSIconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
