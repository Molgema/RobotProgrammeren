//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using ABB.Robotics.ScreenMaker.Windows.Forms;
using System;


namespace HuiswerkScreenMaker
{
    
    
    public class MoveTargetScherm : ABB.Robotics.ScreenMaker.Windows.Forms.ScreenForm
    {
        
        private ABB.Robotics.Tps.Windows.Forms.Button ToggleScherm;
        
        private ABB.Robotics.Tps.Windows.Forms.Button Target;
        
        public MoveTargetScherm()
        {
            this.InitializeComponent();
        }
        
        #region Windows Form Designer generated code
        private void InitializeComponent()
        {
            this.Target = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.ToggleScherm = new ABB.Robotics.Tps.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Target
            // 
            this.Target.BackColor = System.Drawing.Color.White;
            this.Target.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.Target.ForeColor = System.Drawing.SystemColors.ControlText;
            this.Target.Location = new System.Drawing.Point(250, 150);
            this.Target.Name = "Target";
            this.Target.Size = new System.Drawing.Size(140, 70);
            this.Target.Text = "Target";
            this.Target.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            this.Target.Click += new System.EventHandler(this.Target_Click);
            // 
            // ToggleScherm
            // 
            this.ToggleScherm.BackColor = System.Drawing.Color.White;
            this.ToggleScherm.Font = ABB.Robotics.Tps.Windows.Forms.TpsFont.Font12b;
            this.ToggleScherm.ForeColor = System.Drawing.SystemColors.ControlText;
            this.ToggleScherm.Location = new System.Drawing.Point(250, 285);
            this.ToggleScherm.Name = "ToggleScherm";
            this.ToggleScherm.Size = new System.Drawing.Size(140, 70);
            this.ToggleScherm.Text = "Toggle Scherm";
            this.ToggleScherm.TextAlign = ABB.Robotics.Tps.Windows.Forms.ContentAlignmentABB.MiddleCenter;
            this.ToggleScherm.Click += new System.EventHandler(this.ToggleScherm_Click);
            // 
            // MoveTargetScherm
            // 
            this.BackColor = System.Drawing.SystemColors.Control;
            this.Controls.Add(this.ToggleScherm);
            this.Controls.Add(this.Target);
            this.Controls.SetChildIndex(this.Target, 0);
            this.Controls.SetChildIndex(this.ToggleScherm, 0);
            this.ResumeLayout(false);
        }
        #endregion
        
        private void ToggleScherm_Click(object sender, System.EventArgs e)
        {
            try
            {
                // Calling ScreenOpen
                this.ShowScreen(typeof(MoveHomeScherm));
            }
            catch (System.Exception ex)
            {
                ABB.Robotics.Tps.Windows.Forms.GTPUMessageBox.Show(this, null, ex.ToString(), "Unexpected Error in ToggleScherm_Click", System.Windows.Forms.MessageBoxIcon.Hand, System.Windows.Forms.MessageBoxButtons.OK);
            }
        }
        
        private void Target_Click(object sender, System.EventArgs e)
        {
            try
            {
                // Calling RapidDataWrite
                ABB.Robotics.ScreenMaker.Base.IApplicationVariable write_0 = this.ScreenServices.ApplicationVariables["moveTarget"];
                ABB.Robotics.ScreenMaker.Windows.Forms.DataManager.GetRapidData(this, "RAPID/T_ROB1/MainModule/screenInput").Value = ((ABB.Robotics.Controllers.RapidDomain.IRapidData)(write_0.Value));
            }
            catch (System.Exception ex)
            {
                ABB.Robotics.Tps.Windows.Forms.GTPUMessageBox.Show(this, null, ex.ToString(), "Unexpected Error in Target_Click", System.Windows.Forms.MessageBoxIcon.Hand, System.Windows.Forms.MessageBoxButtons.OK);
            }
        }
    }
}
