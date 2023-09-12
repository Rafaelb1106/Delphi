import streamlit as st
import numpy as np
import pandas as pd
import requests
import smtplib
from PIL import Image
from page_config_dict2 import PAGE_CONFIG
from page_config_dict2 import encabezado
st.set_page_config(**PAGE_CONFIG)



encabezado()

def main():
    texto = "Soluciones Tecnológicas Desarrolladas en Delphi y Firebird."   
    st.markdown(f'<p style="font-size: 45px; color: maroon;font-weight: bold;">{texto}</p>', unsafe_allow_html=True)
    
    st.markdown(f'<p style="font-size: 20px; display: inline;text-align: justify;">Me complace introducir dos soluciones especializadas diseñadas en Delphi para trabajar con bases de datos en Firebird. La primera herramienta facilita la transferencia precisa de datos entre bases de datos con estructuras idénticas. La segunda, por su parte, proporciona un análisis detallado de procedimientos almacenados y disparadores específicos pertenecientes a una base de datos de la empresa X en Firebird.</p>', unsafe_allow_html=True)
    st.markdown("<br>", unsafe_allow_html=True)
    st.markdown(f'<p style="font-size: 20px;color: maroon; display: inline;text-align: justify;">1. Herramienta de Migración de Datos en Delphi.</p>', unsafe_allow_html=True)
    st.markdown("<br>", unsafe_allow_html=True)
    st.markdown(f'<p style="font-size: 20px; display: inline;text-align: justify;">Esta aplicación ha sido diseñada específicamente para facilitar el proceso de transferencia de datos entre bases de datos con estructuras idénticas. Con una interfaz intuitiva, permite a los usuarios seleccionar las bases de datos origen y destino, y realizar la copia de información de manera eficiente, garantizando la integridad y consistencia de los datos. </p>', unsafe_allow_html=True)
    st.markdown("<br>", unsafe_allow_html=True)
    col11, col21 = st.columns([ 12, 2])
    # Contenido de la primera columna
    with col11:
        texto = "Versión x64 "   
        st.markdown(f'<p style="font-size: 20px; color: maroon;text-align: right;font-weight: bold;">{texto}</p>', unsafe_allow_html=True)       
   
    with col21:        
        filename = "CopyDataBases_x64.zip"
        with open(filename, "rb") as file:
            btn = st.download_button(
            label="Descargar ",
            data=file,
            file_name="CopyDataBases_x64.zip",
            mime="application/octet-stream"  
            )
    st.markdown("<br>", unsafe_allow_html=True)

    col111, col211 = st.columns([ 12, 2])
    # Contenido de la primera columna
    with col111:
        texto = "Versión x32 "   
        st.markdown(f'<p style="font-size: 20px; color: maroon;text-align: right;font-weight: bold;">{texto}</p>', unsafe_allow_html=True)       
   
    with col211:        
        filename = "CopyDataBases_x32.zip"
        with open(filename, "rb") as file:
            btn = st.download_button(
            label="Descargar ",
            data=file,
            file_name="CopyDataBases_x32.zip",
            mime="application/octet-stream"  
            )
    st.markdown("<hr>", unsafe_allow_html=True)
    ima_dash = Image.open("img/copydatabases.JPG")
    st.image(ima_dash, caption="Vista de la herramienta  ")

    st.markdown("<hr>", unsafe_allow_html=True)
    st.markdown("<br>", unsafe_allow_html=True)
    st.markdown(f'<p style="font-size: 20px;color: maroon; display: inline;text-align: justify;">2. Analizador de Procedimientos Almacenados y Disparadores.</p>', unsafe_allow_html=True)
    st.markdown("<br>", unsafe_allow_html=True)
    st.markdown(f'<p style="font-size: 20px; display: inline;text-align: justify;">Concebida en Delphi, esta aplicación proporciona un análisis meticuloso de procedimientos almacenados y disparadores particularmente diseñados para la Empresa X. Se caracteriza por su profundo enfoque en la optimización y el diagnóstico, asegurando una gestión eficiente y precisa.</p>', unsafe_allow_html=True)
    st.markdown("<br>", unsafe_allow_html=True)    
    col1, col2 = st.columns([ 12, 2])
    # Contenido de la primera columna
    with col1:
        texto = "Versión x32 "   
        st.markdown(f'<p style="font-size: 20px; color: maroon;text-align: right;font-weight: bold;">{texto}</p>', unsafe_allow_html=True)       
   
    with col2:        
        filename = "HerramientasBD_x32.zip"
        with open(filename, "rb") as file:
            btn = st.download_button(
            label="Descargar ",
            data=file,
            file_name="HerramientasBD_x32.zip",
            mime="application/octet-stream"  
            )
    st.markdown("<hr>", unsafe_allow_html=True)
    ima_dash = Image.open("img/ValidarIns.JPG")
    st.image(ima_dash, caption="Vista de la herramienta  ")
    st.markdown("<hr>", unsafe_allow_html=True)
    st.markdown(f'<p style="font-size: 17px; display: inline;text-align: justify;">Para garantizar el óptimo funcionamiento de esta herramienta, es esencial tener instalado Firebird. Puede obtenerlo y proceder con su instalación desde el siguiente <a href="https://firebirdsql.org/en/firebird-3-0-10/" target="_blank" style="text-decoration: none;font-size: 20px; color: #000000;">enlace.</a></p>', unsafe_allow_html=True)


if __name__ == "__main__":
    main()