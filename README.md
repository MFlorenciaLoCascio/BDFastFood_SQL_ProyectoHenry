# **Este README describe los pasos necesarios para que pueda instalar SQL Server en su sistema y abrir los archivos de Base de Datos SQL Server del Proyecto disponible:** 🌐

## 1.  **Instalación de SQL Server para abrir los archivos del proyecto GitHub**  💻

### **Descarga de SQL Server** 

##### [Descargue la versión gratuita](https://www.microsoft.com/en-us/sql-server/sql-server-downloads "descargue la versión gratuita") de SQL Server y selecciona la edición Express desde el sitio web de Microsoft:

https://www.microsoft.com/en-us/sql-server/sql-server-downloads


### **Pasos de Instalación**
**👉 Ejecuta el instalador:** Una vez descargado el instalador, ejecútalo en tu sistema. Sigue las instrucciones en pantalla para completar la instalación.

**👉 Selecciona las características de instalación:** Durante el proceso de instalación, se te pedirá que selecciones las características que deseas instalar. Para abrir archivos de base de datos SQL Server, asegúrate de seleccionar la opción "Motor de base de datos de SQL Server".

**👉 Configura la instancia de SQL Server:** Se le pedirá que configures una instancia de SQL Server. La instancia es el nombre de la instalación de SQL Server en tu sistema. Puedes elegir un nombre predeterminado o especificar uno personalizado.

**👉 Establece los modos de autenticación:** SQL Server ofrece dos modos de autenticación: Autenticación de Windows y autenticación mixta. La autenticación de Windows utiliza las cuentas de usuario del sistema para acceder a SQL Server, mientras que la autenticación mixta permite utilizar cuentas de usuario y contraseñas específicas de SQL Server. Selecciona el modo de autenticación que prefieras.

**👉 Completa la instalación:** Sigue las instrucciones restantes en pantalla para completar la instalación de SQL Server.

### **Verificación de la instalación:**
Una vez finalizada la instalación, puedes verificar si SQL Server se está ejecutando correctamente utilizando el Administrador de servicios de Windows.

1.  Abre el Administrador de servicios de Windows (presiona Windows + R, escribe "services.msc" y presiona Entrar).

2. Busca el servicio "SQL Server (MSSQLSERVER)". Si el servicio está en ejecución, su estado debe ser "En ejecución". Si no está en ejecución, haz clic derecho en el servicio y selecciona "Iniciar".

3. Abrir archivos de base de datos SQL Server:  Una vez instalado y configurado SQL Server, puedes abrir los archivos de base de datos SQL Server del proyecto utilizando SQL Server Management Studio (SSMS). Abre SSMS.

4. Conéctate a la instancia de SQL Server que instalaste. En el Explorador de objetos, expanda la instancia de SQL Server y la carpeta "Bases de datos".

5. Haz clic derecho en la base de datos que deseas abrir y selecciona "Abrir".

### **Debe abrir los archivos en el siguiente orden:** 🗂️

1. [DA_Lo_Cascio_Maria_Florencia_avance1PI ](https://github.com/MFlorenciaLoCascio/BDFastFood_SQL_ProyectoHenry/blob/main/DA_Lo_Cascio_Maria_Florencia_avance1PI.sql "DA_Lo_Cascio_Maria_Florencia_avance1PI ") 
_(Lenguaje DDL - Crear Base de Datos, Tablas y Generar relaciones PK-FK) _

2. [DA_Lo_Cascio_Maria_Florencia_avance2PI](https://github.com/MFlorenciaLoCascio/BDFastFood_SQL_ProyectoHenry/blob/main/DA_Lo_Cascio_Maria_Florencia_avance2PI.sql "DA_Lo_Cascio_Maria_Florencia_avance2PI")
_(Lenguaje DML - Cargar Datos en las tablas, Actualizar y Eliminar Registros)_

3. [DA_Lo_Cascio_Maria_Florencia_avance3PI ](https://github.com/MFlorenciaLoCascio/BDFastFood_SQL_ProyectoHenry/blob/main/DA_Lo_Cascio_Maria_Florencia_avance3PI.sql "DA_Lo_Cascio_Maria_Florencia_avance3PI ")
_(Lenguaje DML - Consultas con Funciones de Agregación, Cláusulas y UNIÓN de tablas)_

4. [DA_Lo_Cascio_Maria_Florencia_avance4PI](https://github.com/MFlorenciaLoCascio/BDFastFood_SQL_ProyectoHenry/blob/main/DA_Lo_Cascio_Maria_Florencia_avance4PI.sql "DA_Lo_Cascio_Maria_Florencia_avance4PI")
_(Lenguaje DML - Consultas con múltiples tablas y los distintos tipos de JOINS)_

5. [DA_Lo_Cascio_Maria_Florencia_avance_Consultas_Avanzadas_PI.sql](https://github.com/MFlorenciaLoCascio/BDFastFood_SQL_ProyectoHenry/blob/main/DA_Lo_Cascio_Maria_Florencia_avance_Consultas_Avanzadas_PI.sql "DA_Lo_Cascio_Maria_Florencia_avance_Consultas_Avanzadas_PI.sql")
_(Lenguaje DML - Consultas Finales)_

## 2. **DER:**
**Diagrama Entidad-Relación generado en SQL:**  [DER_FastFood_SQL.png](https://github.com/MFlorenciaLoCascio/BDFastFood_SQL_ProyectoHenry/blob/main/DER_FastFood_SQL.png "DER_FastFood_SQL.png")

**Diagrama Entidad-Relación generado en Draw.io:** [DER_FastFood_Draw.io.jpg](https://github.com/MFlorenciaLoCascio/BDFastFood_SQL_ProyectoHenry/blob/main/DER_FastFood_Draw.io.jpg "DER_FastFood_Draw.io.jpg")


## 3. **Informe del Proyecto:**

[Informe_FastFood_BD_Lo_Cascio_Maria_Florencia.pdf](https://github.com/MFlorenciaLoCascio/BDFastFood_SQL_ProyectoHenry/blob/main/Informe_FastFood_BD_Lo_Cascio_Maria_Florencia.pdf "Informe_FastFood_BD_Lo_Cascio_Maria_Florencia.pdf")

## 4. **Herramientas utilizadas:** 

- **SQL Server:** Sistema de gestión de bases de datos relacional para almacenar, administrar y analizar datos de forma segura y eficiente.

- **Lenguajes SQL:**
DDL (Data Definition Language) para crear las tablas y relaciones en SQL Server
DML (Data Manipulation Language) para insertar, consultar, actualizar y eliminar datos de la base de datos.

- **Canva:** Herramienta de diseño gráfico online para crear el logo del proyecto de forma creativa y profesional.

- **Draw.io:** Herramienta online para la creación de diagramas, utilizada para elaborar el diagrama entidad-relación (DER) del proyecto.

- **Google Docs:** Plataforma online para la creación y edición colaborativa de documentos, utilizada para la elaboración del informe final del proyecto.


##### 🔗 Linkedin: https://www.linkedin.com/in/maria-florencia-lo-cascio 
##### 📧 Email: florlocascio5@gmail.com 
