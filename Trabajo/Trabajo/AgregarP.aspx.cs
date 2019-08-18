using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;

namespace Trabajo
{
    public partial class AgregarP : System.Web.UI.Page
    {
        string cadenaconexion = "Data Source=JUVE\\SQLEXPRESS;Initial Catalog=SistemaCata; Trusted_Connection=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            //Obtener datos de la imagen
            int tamanio = fuploadimagen.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[tamanio];

            fuploadimagen.PostedFile.InputStream.Read(ImagenOriginal, 0, tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(fuploadimagen.PostedFile.InputStream);

            //Redimencionar imagen

            System.Drawing.Image imtThumnail;
            int TamanioThumbnail = 350;
            imtThumnail = RedimencionarImagen(ImagenOriginalBinaria, TamanioThumbnail);
            byte[] bTmagenThumbnail = new byte[TamanioThumbnail];


            ImageConverter Convertir = new ImageConverter();
            bTmagenThumbnail = (byte[])Convertir.ConvertTo(imtThumnail, typeof(byte[]));
            //Insertar a la base de datos la info

            SqlConnection con = new SqlConnection(cadenaconexion);
            SqlCommand cmd = new SqlCommand
            {
                CommandText = "INSERT INTO Imagenes(imagen, titulo, detalles, precio) VALUES (@imagen, @titulo, @detalles, @precio)"
            };
            cmd.Parameters.Add("@imagen", SqlDbType.Image).Value = bTmagenThumbnail;
            cmd.Parameters.Add("@titulo", SqlDbType.Text).Value = txttitulo.Text;
            cmd.Parameters.Add("@precio", SqlDbType.Text).Value = (txtprecio.Text);
            cmd.Parameters.Add("@detalles", SqlDbType.Text).Value = txtdescripcion.Text;



            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }



            string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(bTmagenThumbnail);
            imgPreview.ImageUrl = ImagenDataURL64;

        }
        public System.Drawing.Image RedimencionarImagen(System.Drawing.Image ImagenOriginal, int Alto)
        {
            var Radio = (double)Alto / ImagenOriginal.Height;
            var NuevoAncho = (int)(ImagenOriginal.Width * Radio);
            var NuevoAlto = (int)(ImagenOriginal.Height * Radio);
            var NuevaImagenRedimencionada = new Bitmap(NuevoAncho, NuevoAlto);
            var g = Graphics.FromImage(NuevaImagenRedimencionada);
            g.DrawImage(ImagenOriginal, 0, 0, NuevoAncho, NuevoAlto);
            return NuevaImagenRedimencionada;



        }

        


    }
}