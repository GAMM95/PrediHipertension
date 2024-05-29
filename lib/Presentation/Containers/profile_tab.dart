import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Core/Services/firebase_auth.dart';
import '../../Core/Theme/global_colors.dart';
import '../Utilities/custom_dialogs.dart';
import '../Widget/custom_button.dart';
import '../Widget/custom_card.dart';

// Pantalla que muestra la información del perfil del usuario
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final AuthService _authService = AuthService();
  TextEditingController nombreController = TextEditingController();
  User? currentUser;
  String? displayNameFromFirestore;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getDisplayName();
  }

  // Obtiene el usuario actualmente autenticado
  Future<void> getCurrentUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    setState(() {});
  }

  // Obtiene el nombre completo del usuario desde Firestore
  Future<void> getDisplayName() async {
    String fullName = await AuthService.getDisplayNameFromFirestore();
    setState(() {
      displayNameFromFirestore = fullName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.bgDark2,
      child: Column(
        children: [
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
                          backgroundImage: currentUser != null &&
                                  currentUser!.photoURL != null
                              ? NetworkImage(currentUser!.photoURL!)
                              : null,
                          radius: 70,
                          backgroundColor: Colors.grey[500],
                          child: currentUser != null &&
                                  currentUser!.photoURL == null
                              ? const Icon(
                                  Icons.person,
                                  size: 100,
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
                                fontSize: 16.0,
                              ),
                            ),
                            subtitle: Text(
                              displayNameFromFirestore ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.0,
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
                              fontSize: 16.0,
                            ),
                          ),
                          subtitle: Text(
                            currentUser!.email ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: GlobalColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        // Botones para cerrar sesión y eliminar cuenta
                        CustomButton(
                          texto: 'Cerrar sesión',
                          onPressed: () {
                            // Muestra un diálogo de confirmación antes de cerrar sesion
                            CustomDialogs.cerrarSesion(context);
                          },
                          isEnabled: true,
                        ),
                        CustomButton(
                          texto: 'Eliminar cuenta',
                          onPressed: () {
                            // Muestra un diálogo de confirmación antes de eliminar la cuenta
                            CustomDialogs.eliminarCuenta(
                              context,
                              'Nos apena que te vayas',
                              'Esperamos regreses pronto.',
                              () {
                                _authService.deleteAccount();
                              },
                            );
                          },
                          isEnabled: true,
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
