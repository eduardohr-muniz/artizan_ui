import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';

class IconButtonWithMenuUseCase extends StatefulWidget {
  const IconButtonWithMenuUseCase({super.key});

  @override
  State<IconButtonWithMenuUseCase> createState() => _IconButtonWithMenuUseCaseState();
}

class _IconButtonWithMenuUseCaseState extends State<IconButtonWithMenuUseCase> {
  final ArtContextMenuController _menuController = ArtContextMenuController();
  final ArtContextMenuController _menuController2 = ArtContextMenuController();
  final ArtContextMenuController _menuController3 = ArtContextMenuController();
  final ArtContextMenuController _menuController4 = ArtContextMenuController();

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
            ArtContextMenu(
              controller: _menuController,
              items: [
                ArtContextMenuItem(
                  leading: const Icon(Icons.edit, size: 16),
                  onPressed: () {
                    _menuController.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Editar clicado!')),
                    );
                  },
                  child: const Text('Editar'),
                ),
                ArtContextMenuItem(
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
              child: ArtIconButton(
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

            ArtContextMenu(
              controller: _menuController2,
              items: [
                ArtContextMenuItem(
                  leading: const Icon(Icons.edit, size: 16),
                  onPressed: () {
                    _menuController2.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Editar clicado!')),
                    );
                  },
                  child: const Text('Editar'),
                ),
                ArtContextMenuItem(
                  leading: const Icon(Icons.copy, size: 16),
                  onPressed: () {
                    _menuController2.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Copiar clicado!')),
                    );
                  },
                  child: const Text('Copiar'),
                ),
                ArtContextMenuItem(
                  leading: const Icon(Icons.more_horiz, size: 16),
                  trailing: const Icon(Icons.chevron_right, size: 16),
                  items: [
                    ArtContextMenuItem(
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
                    ArtContextMenuItem(
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
              child: ArtIconButton(
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
                ArtContextMenu(
                  controller: _menuController3,
                  items: [
                    ArtContextMenuItem(
                      leading: const Icon(Icons.edit, size: 16),
                      onPressed: () {
                        _menuController3.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editar!')),
                        );
                      },
                      child: const Text('Editar'),
                    ),
                    ArtContextMenuItem(
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
                  child: ArtIconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      _menuController3.show();
                    },
                  ),
                ),

                const SizedBox(width: 16),

                // IconButton outline
                ArtContextMenu(
                  controller: _menuController4,
                  items: [
                    ArtContextMenuItem(
                      leading: const Icon(Icons.edit, size: 16),
                      onPressed: () {
                        _menuController4.hide();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editar!')),
                        );
                      },
                      child: const Text('Editar'),
                    ),
                    ArtContextMenuItem(
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
                  child: ArtIconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      _menuController4.show();
                    },
                  ),
                ),

                const SizedBox(width: 16),

                // IconButton ghost
                ArtContextMenuRegion(
                  items: [
                    ArtContextMenuItem(
                      leading: const Icon(Icons.edit, size: 16),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Editar!')),
                        );
                      },
                      child: const Text('Editar'),
                    ),
                    ArtContextMenuItem(
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
                  child: ArtIconButton(
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
