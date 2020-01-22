<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class aula1BD_Form
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.TestDBConnection = New System.Windows.Forms.Button()
        Me.GetTableContent = New System.Windows.Forms.Button()
        Me.Server_Label = New System.Windows.Forms.Label()
        Me.User_Label = New System.Windows.Forms.Label()
        Me.Pasword_Label = New System.Windows.Forms.Label()
        Me.dbServer = New System.Windows.Forms.TextBox()
        Me.dbName = New System.Windows.Forms.TextBox()
        Me.userPass = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'TestDBConnection
        '
        Me.TestDBConnection.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TestDBConnection.Location = New System.Drawing.Point(12, 190)
        Me.TestDBConnection.Name = "TestDBConnection"
        Me.TestDBConnection.Size = New System.Drawing.Size(164, 32)
        Me.TestDBConnection.TabIndex = 0
        Me.TestDBConnection.Text = "Testar Ligação BD"
        Me.TestDBConnection.UseVisualStyleBackColor = True
        '
        'GetTableContent
        '
        Me.GetTableContent.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GetTableContent.Location = New System.Drawing.Point(268, 190)
        Me.GetTableContent.Name = "GetTableContent"
        Me.GetTableContent.Size = New System.Drawing.Size(164, 32)
        Me.GetTableContent.TabIndex = 1
        Me.GetTableContent.Text = "Conteudo Tabela Hello"
        Me.GetTableContent.UseVisualStyleBackColor = True
        '
        'Server_Label
        '
        Me.Server_Label.AutoSize = True
        Me.Server_Label.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Server_Label.Location = New System.Drawing.Point(23, 34)
        Me.Server_Label.Name = "Server_Label"
        Me.Server_Label.Size = New System.Drawing.Size(44, 16)
        Me.Server_Label.TabIndex = 2
        Me.Server_Label.Text = "Server"
        '
        'User_Label
        '
        Me.User_Label.AutoSize = True
        Me.User_Label.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.User_Label.Location = New System.Drawing.Point(23, 82)
        Me.User_Label.Name = "User_Label"
        Me.User_Label.Size = New System.Drawing.Size(35, 16)
        Me.User_Label.TabIndex = 3
        Me.User_Label.Text = "User"
        '
        'Pasword_Label
        '
        Me.Pasword_Label.AutoSize = True
        Me.Pasword_Label.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Pasword_Label.Location = New System.Drawing.Point(23, 132)
        Me.Pasword_Label.Name = "Pasword_Label"
        Me.Pasword_Label.Size = New System.Drawing.Size(65, 16)
        Me.Pasword_Label.TabIndex = 4
        Me.Pasword_Label.Text = "Password"
        '
        'dbServer
        '
        Me.dbServer.Location = New System.Drawing.Point(94, 34)
        Me.dbServer.Name = "dbServer"
        Me.dbServer.Size = New System.Drawing.Size(338, 20)
        Me.dbServer.TabIndex = 5
        '
        'dbName
        '
        Me.dbName.Location = New System.Drawing.Point(94, 78)
        Me.dbName.Name = "dbName"
        Me.dbName.Size = New System.Drawing.Size(338, 20)
        Me.dbName.TabIndex = 6
        '
        'userPass
        '
        Me.userPass.Location = New System.Drawing.Point(94, 128)
        Me.userPass.Name = "userPass"
        Me.userPass.Size = New System.Drawing.Size(338, 20)
        Me.userPass.TabIndex = 7
        '
        'aula1BD_Form
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(444, 234)
        Me.Controls.Add(Me.userPass)
        Me.Controls.Add(Me.dbName)
        Me.Controls.Add(Me.dbServer)
        Me.Controls.Add(Me.Pasword_Label)
        Me.Controls.Add(Me.User_Label)
        Me.Controls.Add(Me.Server_Label)
        Me.Controls.Add(Me.GetTableContent)
        Me.Controls.Add(Me.TestDBConnection)
        Me.Name = "aula1BD_Form"
        Me.Text = "Aula1 - BD"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents TestDBConnection As Button
    Friend WithEvents GetTableContent As Button
    Friend WithEvents Server_Label As Label
    Friend WithEvents User_Label As Label
    Friend WithEvents Pasword_Label As Label
    Friend WithEvents dbServer As TextBox
    Friend WithEvents dbName As TextBox
    Friend WithEvents userPass As TextBox
End Class
