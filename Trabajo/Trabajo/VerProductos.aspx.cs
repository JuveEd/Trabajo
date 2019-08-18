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
    public partial class VerProductos : System.Web.UI.Page
    {
        string cadenaconexion = "Data Source=JUVE\\SQLEXPRESS;Initial Catalog=SistemaCata; Trusted_Connection=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            consultarImagen();
        }

        protected void consultarImagen()
        {
            SqlConnection con = new SqlConnection(cadenaconexion);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Select imagen, titulo, detalles, precio From Imagenes ORDER BY ID ASC";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();

            DataTable ImagenesBD = new DataTable();
            ImagenesBD.Load(cmd.ExecuteReader());

            Repeater1.DataSource = ImagenesBD;
            Repeater1.DataBind();
            con.Close();
        }
  
    }
}