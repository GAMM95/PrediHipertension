import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:predihipertension/Presentation/Widget/custom_card.dart';
import 'package:predihipertension/Core/Services/firebase_auth.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Presentation/Utilities/custom_dialogs.dart';
import 'package:predihipertension/Presentation/Widget/custom_button.dart';

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
          // const TituloTab(titulo: 'Mi perfil'),
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
                              : null,
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
                                fontSize: 16.0,
                              ),
                            ),
                            subtitle: Text(
                              currentUser!.displayName ?? '',
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
                        CustomButton(
                          texto: 'Cerrar sesión',
                          onPressed: () {
                            CustomDialogs.cerrarSesion(context);
                          },
                          isEnabled: true,
                        ),

                        CustomButton(
                          texto: 'Eliminar cuenta',
                          onPressed: () {
                            // Lógica del botón Eliminar cuenta
                            CustomDialogs.eliminarCuenta(
                              context,
                              'Nos apena que te vayas',
                              'Esperamos regreses pronto.',
                            );
                            _authService.deleteAccount();
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
