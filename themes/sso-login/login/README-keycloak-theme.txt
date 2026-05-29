# Keycloak Custom Login Theme: demo

Este paquete contiene un tema personalizado para la pantalla de inicio de sesión de Keycloak.

## Estructura

```
demo/
└── login/
    ├── theme.properties
    ├── login.ftl
    ├── resources/
    │   ├── css/
    │   │   └── styles.css
    │   └── img/
    │       └── logo.png  (agrega tu logo aquí)
    └── messages/
        └── messages_en.properties
```

## Instrucciones de uso

1. Copia el contenido de esta carpeta `demo/` dentro del directorio de temas de Keycloak:

   ```bash
   sudo cp -r demo /opt/keycloak/themes/
   ```

2. Inicia Keycloak en modo desarrollo desactivando la caché de temas:

   ```bash
   ./kc.sh start-dev --spi-theme-cache-themes=false --spi-theme-cache-templates=false
   ```

3. Entra a la consola de administración de Keycloak:
   - URL por defecto: http://localhost:8080/admin

4. Ve a **Realm Settings > Themes** y selecciona `demo` como Login Theme.

5. Guarda los cambios y prueba la pantalla de login.

## Personalización

- Puedes cambiar el logo colocando un archivo `logo.png` en `resources/img/`.
- Modifica `styles.css` para personalizar colores, tipografías y layout.
- Edita `messages_en.properties` para cambiar textos en la interfaz.
