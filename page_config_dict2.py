from PIL import Image
import streamlit as st
import numpy as np
import smtplib

PAGE_CONFIG = {"page_title"            : "Proyectos en Delphi",
                #    "page_icon"             : ":panda_face:",
               #"page_icon"             : Image.open("sources/curiosidades-del-oso-panda-1280x720x80xX.jpg"),
               "layout"                : "wide"}

def enviar_correo(destinatario, asunto, mensaje):
    # Configurar el servidor SMTP
    servidor_smtp = smtplib.SMTP("smtp.gmail.com", 587)
    servidor_smtp.starttls()
    
    # Autenticar con las credenciales del remitente
    remitente = "rafaelb1106@gmail.com"
    contraseña = "ldfljayuqrjfjjiv"
    servidor_smtp.login(remitente, contraseña)
    
    # Crear el cuerpo del mensaje
    mensaje_correo = f"Subject: Mensaje_desde_CV_{asunto}\n\n{mensaje}"
    
    # Enviar el correo electrónico
    servidor_smtp.sendmail(remitente, destinatario, mensaje_correo)
    
    # Cerrar la conexión con el servidor SMTP
    servidor_smtp.quit()
def encabezado():
    fotoR = "img/01foto_rafa.jpg"
    img_width = 200
    img_height = 200
    imagen = Image.open(fotoR).convert("RGBA")
    # Redimensionar la imagen a un tamaño cuadrado
    imagen = imagen.resize((200, 250))
    # Convertir la imagen a un arreglo de numpy
    imagen_np = np.array(imagen)
    # Crear una máscara circular
    altura, ancho, _ = imagen_np.shape
    y, x = np.ogrid[:altura, :ancho]
    distancia_al_centro_horizontal = (x - ancho/2) ** 2 / (ancho/2) ** 2
    distancia_al_centro_vertical = (y - altura/2) ** 2 / (altura/2) ** 2
    mascara = distancia_al_centro_horizontal + distancia_al_centro_vertical > 1
    imagen_np[mascara] = [0, 0, 0, 0]  # Establecer píxeles fuera del círculo en negro
    imagen_circular = Image.fromarray(imagen_np)
    texto = "Contacto"   
    st.sidebar.markdown(f'<p style="font-size: 35px; color: maroon;">{texto}</p>', unsafe_allow_html=True)

    numero_telefono = "+34671523462"  
    correo_destino = "rafaelb1106@gmail.com"  
    enlace_whatsapp = f"https://wa.me/{numero_telefono}" 
    enlace_correo = f"mailto:{correo_destino}"
    enlace_lin = f"https://www.linkedin.com/in/rafaelballesterosmonsalve/" 
    enlace_cv = f"https://rafaelhernandoballesteroscv.streamlit.app/"
    col11, col22 = st.sidebar.columns([1, 8]) 
    with col11: 
        st.image("img/movil.jpg",width= 33) 
        st.image("img/ico_wa.png",width= 33)
        st.image("img/email.png",width= 33)
        st.image("img/ico_lin.png",width= 33)
        st.image("img/dir.png",width= 33)
        st.image("img/cv.png",width= 33)
    with col22:
        st.markdown(f'<p style="font-size: 20px; color: #000000;">+34 671 523462</p>', unsafe_allow_html=True)
        st.markdown(f'<a href="{enlace_whatsapp}" target="_blank" style="text-decoration: none;font-size: 20px; color: #000000;">671523462</a>', unsafe_allow_html=True)
        st.markdown(f'<a href="{enlace_correo}" target="_blank" style="text-decoration: none;font-weight: bold;font-size: 20px; color: #000000;">rafaelb1106@gmail.com</a>', unsafe_allow_html=True)
        st.markdown(f'<a href="{enlace_lin}" target="_blank" style="text-decoration: none;font-size: 20px; color: #000000;">Rafael Ballesteros</a>', unsafe_allow_html=True)
        st.markdown(f'<p style="font-size: 18px; color: #000000;"> 28014, Madrid, España</p>', unsafe_allow_html=True)
        st.markdown(f'<a href="{enlace_cv}" target="_blank" style="text-decoration: none;font-size: 20px; color: #000000;">Curriculum Vitae</a>', unsafe_allow_html=True)
   
    ###################
    destinatario = "rafaelb1106@hotmail.com"
    st.sidebar.markdown("<hr>", unsafe_allow_html=True)
    st.sidebar.markdown(f'<p style="font-size: 20px; color: #000000;font-weight: bold;">Enviar mensaje </p>', unsafe_allow_html=True)
    #c_msn = st.empty()
    tt = ""
    correo = st.sidebar.text_input("Email",value=tt)
    asunto = st.sidebar.text_input("Asunto",value=tt)
    mensaje = st.sidebar.text_area("Mensaje",value=tt)

    mensaje = f"{mensaje} correo contacto: {correo}"
    # Botón para enviar el correo
    if st.sidebar.button("Enviar"):
        if  asunto != "" and mensaje != "" and correo != "" :
            enviar_correo(destinatario, asunto, mensaje)
            st.sidebar.success("¡El mensaje ha sido enviado con éxito!")            
            tt = ""
        else:
            st.sidebar.warning("Por favor, completa todos los campos antes de enviar el correo.")
            tt = ""
            



    # #################    
        
    col1, col2 = st.columns([ 2, 12])
    # Contenido de la primera columna
    with col1:
        st.image(imagen_circular, use_column_width= True)
    # Contenido de la segunda columna
    with col2:
        texto = "Rafael Ballesteros Monsalve"   
        st.markdown(f'<p style="font-size: 70px; color: maroon;text-align: right;font-weight: bold;">{texto}</p>', unsafe_allow_html=True)
        texto = "Ingeniero de Sistemas"   
        st.markdown(f'<p style="font-size: 60px; color: black;text-align: right;font-weight: bold;">{texto}</p>', unsafe_allow_html=True)
    st.markdown("<hr>", unsafe_allow_html=True)

    
