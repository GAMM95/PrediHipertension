import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Components/custom_card.dart';
import '../Services/firebase_auth.dart';
import '../Theme/global_colors.dart';
import '../Utilities/custom_dialogs.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final AuthService _authService = AuthService();

  TextEditingController nombreController = TextEditingController();

  User? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.bgDark2,
      child: Column(
        children: [
          Container(
            color: GlobalColors.bgPanelDark2,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Mi perfil',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: GlobalColors.textColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10.0,
                  ),
                  child: CustomCard(
                    title: 'Información personal',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10.0),
                        // Foto del usuario
                        CircleAvatar(
                          backgroundImage: currentUser != null
                              ? NetworkImage(currentUser!.photoURL ?? '')
                              : null, // Usar null para mostrar el icono de persona predeterminado
                          radius: 70,
                          backgroundColor: Colors.grey[500],
                          child: currentUser != null &&
                                  currentUser!.photoURL == null
                              ? const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        const SizedBox(height: 10.0),
                        // Datos del usuario
                        if (currentUser != null)
                          ListTile(
                            title: Text(
                              'Nombre completo:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: GlobalColors.textColor,
                              ),
                            ),
                            subtitle: Text(
                              currentUser!.displayName ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: GlobalColors.textColor,
                              ),
                            ),
                          ),
                        ListTile(
                          title: Text(
                            'Correo electrónico:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: GlobalColors.textColor,
                            ),
                          ),
                          subtitle: Text(
                            currentUser!.email ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: GlobalColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Lógica del botón Eliminar cuenta
                                CustomDialogs.cerrarSesion(context);
                              },
                              child: const Text(
                                'Cerrar sesión',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Lógica del botón Eliminar cuenta
                                CustomDialogs.eliminarCuenta(
                                  context,
                                  'Nos apena que te vayas',
                                  'Esperamos regreses pronto.',
                                );
                                _authService.deleteAccount();
                              },
                              child: const Text(
                                'Eliminar cuenta',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
