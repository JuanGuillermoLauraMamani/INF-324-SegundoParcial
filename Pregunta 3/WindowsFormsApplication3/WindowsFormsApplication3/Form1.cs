using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;


namespace WindowsFormsApplication3
{
    public partial class Form1 : Form
    {
        int cR, cG, cB;
        int cRt, cGt, cBt;
        int cRx, cGx, cBx;

        
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            Bitmap bmp = new Bitmap(openFileDialog1.FileName);
            pictureBox1.Image = bmp;
            Bitmap bmp2 = new Bitmap(bmp.Width, bmp.Height);
            Color c = new Color();
            
                for (int i = 0; i < bmp.Width; i++) 
                { 
                    for (int j = 0; j < bmp.Height; j++)
                    {
                        c = bmp.GetPixel(i, j);
                        bmp2.SetPixel(i, j, c);
                    }
                }
            
           
              
            pictureBox2.Image = bmp2;
        }

       
        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
        int x = 0;
        int y = 0;
        int n1 = 0;
        int n2 = 0;
        int n3 = 0;
        int ex=0;
        int ey=0;


        Color[] coloresc1;
        int[] cantidadc1;

        Color[] coloresc2;
        int[] cantidadc2;

        Color[] coloresc3;
        int[] cantidadc3;


        int x0 = 0;
        int xf = 154;
        int y0 = 0;
        int yf = 574;

        




        private void pictureBox1_MouseClick(object sender, MouseEventArgs e)
        {

            Bitmap bmp = new Bitmap(pictureBox1.Image);
            Color c = new Color();
            ex = e.X;
            ey = e.Y;
            c = bmp.GetPixel(e.X, e.Y);
            cRx = 0;
            cGx = 0;
            cBx = 0;
            int p = 0;

            pictureBox3.BackColor = c;
            for (int i = e.X; (i < e.X + 10) && (i < bmp.Width); i++)
                for (int j = e.Y; (j < e.Y + 10) && (j < bmp.Height); j++)
                {
                    p++;
                    c = bmp.GetPixel(i, j);
                    cRx = c.R + cRx;
                    cGx = c.G + cGx;
                    cBx = c.B + cBx;
                }
            cRx = cRx / 100;
            cGx = cGx / 100;
            cBx = cBx / 100;
            textBox1.Text = c.R.ToString() + " " + cRx.ToString();
            textBox2.Text = c.G.ToString() + " " + cGx.ToString();
            textBox3.Text = c.B.ToString() + " " + cBx.ToString();
            pictureBox7.BackColor = Color.FromArgb(cRx, cGx, cBx);

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(pictureBox1.Image);
            Bitmap bmpPaleta = new Bitmap(50, 50);
            Color c = new Color();
            c = bmp.GetPixel(ex, ey);
            x = bmp.Width;
            y = bmp.Height;
            coloresc1 = new Color[x * y];
            cantidadc1 = new int[x * y];
            for (int i = x0; i < xf; i = i + 5)
                for (int j = y0; j < yf; j = j + 5)
                {
                    c = bmp.GetPixel(i, j);
                    int r = Existec1(c, n1);
                    if (r == -1)
                    {
                        coloresc1[n1] = c;
                        cantidadc1[n1] = 1;
                        n1++;
                    }
                    else
                    {
                        cantidadc1[r]++;
                    }


                }

            Ordc1(n1);

            int cc = 0;
            for (int k = 0; k < bmpPaleta.Width; k += 50)
            {
                for (int i = k; i < bmpPaleta.Width; i++)
                {
                    for (int j = 0; j < bmpPaleta.Height; j++)
                    {
                        bmpPaleta.SetPixel(i, j, coloresc1[cc]);
                    }
                }
                cc++;
            }
            pictureBox4.Image = bmpPaleta;
        }
        int x1 = 230;
        int xf1 = 544;
        int y1 = 82;
        int yf1 = 287;

        

        private void button4_Click(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(pictureBox1.Image);
            Bitmap bmpPaleta = new Bitmap(50, 50);
            Color c = new Color();
            c = bmp.GetPixel(ex, ey);
            x = bmp.Width;
            y = bmp.Height;
            coloresc2 = new Color[x * y];
            cantidadc2 = new int[x * y];
            for (int i = x1; i < xf1; i = i + 5)
                for (int j = y1; j < yf1; j = j + 5)
                {
                    c = bmp.GetPixel(i, j);
                    int r = Existec2(c, n2);
                    if (r == -1)
                    {
                        coloresc2[n2] = c;
                        cantidadc2[n2] = 1;
                        n2++;
                    }
                    else
                    {
                        cantidadc2[r]++;
                    }


                }

            Ordc2(n2);

            int cc = 0;
            for (int k = 0; k < bmpPaleta.Width; k += 50)
            {
                for (int i = k; i < bmpPaleta.Width; i++)
                {
                    for (int j = 0; j < bmpPaleta.Height; j++)
                    {
                        bmpPaleta.SetPixel(i, j, coloresc2[cc]);
                    }
                }
                cc++;
            }
            pictureBox5.Image = bmpPaleta;
        }

        int x2 = 478;
        int xf2 = 789;
        int y2 = 0;
        int yf2 = 404;

        private void button5_Click(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(pictureBox1.Image);
            Bitmap bmpPaleta = new Bitmap(50, 50);
            Color c = new Color();
            c = bmp.GetPixel(ex, ey);
            x = bmp.Width;
            y = bmp.Height;
            coloresc3 = new Color[x * y];
            cantidadc3 = new int[x * y];
            for (int i = x2; i < xf2; i = i + 5)
                for (int j = y2; j < yf2; j = j + 5)
                {
                    c = bmp.GetPixel(i, j);
                    int r = Existec3(c, n3);
                    if (r == -1)
                    {
                        coloresc3[n3] = c;
                        cantidadc3[n3] = 1;
                        n3++;
                    }
                    else
                    {
                        cantidadc3[r]++;
                    }

                }


            Ordc3(n3);
            int cc = 0;
            for (int k = 0; k < bmpPaleta.Width; k += 50)
            {
                for (int i = k; i < bmpPaleta.Width; i++)
                {
                    for (int j = 0; j < bmpPaleta.Height; j++)
                    {
                        bmpPaleta.SetPixel(i, j, coloresc3[cc]);
                    }
                }
                cc++;
            }
            pictureBox6.Image = bmpPaleta;
        }

       
        private void pictureBox4_MouseClick(object sender, MouseEventArgs e)
        {
            Bitmap img = new Bitmap(pictureBox1.Image);
            Bitmap bmp = new Bitmap(pictureBox4.Image);
            Bitmap bmp2 = new Bitmap(img.Width, img.Height);
            Color c = new Color();
            c = bmp.GetPixel(e.X, e.Y);
            cR = c.R;
            cG = c.G;
            cB = c.B;
            int p = 0;
            for (int i = 0; i < img.Width; i++)
                for (int j = 0; j < img.Height; j++)
                {
                    Color cx = img.GetPixel(i, j);
                    cRx = cx.R;
                    cGx = cx.G;
                    cBx = cx.B;
                    if (((cR - 20 <= cRx) && (cRx <= cR + 20)) && ((cG - 20 <= cGx) && (cGx <= cG + 20)) && ((cB - 20 <= cBx) && (cBx <= cB + 20)))
                    {
                        bmp2.SetPixel(i, j, cx);
                    }
                }
            pictureBox2.Image = bmp2;
        }

        private void pictureBox5_MouseClick(object sender, MouseEventArgs e)
        {
            Bitmap img = new Bitmap(pictureBox1.Image);
            Bitmap bmp = new Bitmap(pictureBox5.Image);
            Bitmap bmp2 = new Bitmap(img.Width, img.Height);
            Color c = new Color();
            c = bmp.GetPixel(e.X, e.Y);
            cR = c.R;
            cG = c.G;
            cB = c.B;
            int p = 0;
            for (int i = 0; i < img.Width; i++)
                for (int j = 0; j < img.Height; j++)
                {
                    Color cx = img.GetPixel(i, j);
                    cRx = cx.R;
                    cGx = cx.G;
                    cBx = cx.B;
                    if (((cR - 20 <= cRx) && (cRx <= cR + 20)) && ((cG - 20 <= cGx) && (cGx <= cG + 20)) && ((cB - 20 <= cBx) && (cBx <= cB + 20)))
                    {
                        bmp2.SetPixel(i, j, cx);
                    }
                }
            pictureBox2.Image = bmp2;
        }

        private void pictureBox6_MouseClick(object sender, MouseEventArgs e)
        {
            Bitmap img = new Bitmap(pictureBox1.Image);
            Bitmap bmp = new Bitmap(pictureBox6.Image);
            Bitmap bmp2 = new Bitmap(img.Width, img.Height);
            Color c = new Color();
            c = bmp.GetPixel(e.X, e.Y);
            cR = c.R;
            cG = c.G;
            cB = c.B;
            int p = 0;
            for (int i = 0; i < img.Width; i++)
                for (int j = 0; j < img.Height; j++)
                {
                    Color cx = img.GetPixel(i, j);
                    cRx = cx.R;
                    cGx = cx.G;
                    cBx = cx.B;
                    if (((cR - 20 <= cRx) && (cRx <= cR + 20)) && ((cG - 20 <= cGx) && (cGx <= cG + 20)) && ((cB - 20 <= cBx) && (cBx <= cB + 20)))
                    {
                        bmp2.SetPixel(i, j, cx);
                    }
                }
            pictureBox2.Image = bmp2;
        }

       
       
        private void btn_limpiar_Click(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(pictureBox1.Image);
            Bitmap bmp2 = new Bitmap(bmp.Width, bmp.Height);
            Color c = new Color();
            for (int i = 0; i < bmp.Width; i++)
                for (int j = 0; j < bmp.Height; j++)
                {
                    c = bmp.GetPixel(i, j);
                    bmp2.SetPixel(i, j, c);
                }
            pictureBox2.Image = bmp2;
        }



        private int Existec1(Color c, int indice)
        {
            int sw = -1;
            for (int j = 0; j < indice + 1; j++)
            {
                if (coloresc1[j].Equals(c))
                {
                    sw = j;
                    break;
                }
            }
            return sw;

        }


        private void Ordc1(int indice)
        {
            for (int k = 0; k < indice; k++)
            {
                for (int i = 0; i < indice - k - 1; i++)
                {
                    if (cantidadc1[i] < cantidadc1[i + 1])
                    {
                        int tmp = cantidadc1[i + 1];
                        cantidadc1[i + 1] = cantidadc1[i];
                        cantidadc1[i] = tmp;

                        Color tmp2 = coloresc1[i + 1];
                        coloresc1[i + 1] = coloresc1[i];
                        coloresc1[i] = tmp2;
                    }
                }
            }
        }


        private int Existec2(Color c, int indice)
        {
            int sw = -1;
            for (int j = 0; j < indice + 1; j++)
            {
                if (coloresc2[j].Equals(c))
                {
                    sw = j;
                    break;
                }
            }
            return sw;

        }


        private void Ordc2(int indice)
        {
            for (int k = 0; k < indice; k++)
            {
                for (int i = 0; i < indice - k - 1; i++)
                {
                    if (cantidadc2[i] < cantidadc2[i + 1])
                    {
                        int tmp = cantidadc2[i + 1];
                        cantidadc2[i + 1] = cantidadc2[i];
                        cantidadc2[i] = tmp;

                        Color tmp2 = coloresc2[i + 1];
                        coloresc2[i + 1] = coloresc2[i];
                        coloresc2[i] = tmp2;
                    }
                }
            }
        }


        private int Existec3(Color c, int indice)
        {
            int sw = -1;
            for (int j = 0; j < indice + 1; j++)
            {
                if (coloresc3[j].Equals(c))
                {
                    sw = j;
                    break;
                }
            }
            return sw;

        }


        private void Ordc3(int indice)
        {
            for (int k = 0; k < indice; k++)
            {
                for (int i = 0; i < indice - k - 1; i++)
                {
                    if (cantidadc3[i] < cantidadc3[i + 1])
                    {
                        int tmp = cantidadc3[i + 1];
                        cantidadc3[i + 1] = cantidadc3[i];
                        cantidadc3[i] = tmp;

                        Color tmp2 = coloresc3[i + 1];
                        coloresc3[i + 1] = coloresc3[i];
                        coloresc3[i] = tmp2;
                    }
                }
            }
        }
   
    }
        
    
}
