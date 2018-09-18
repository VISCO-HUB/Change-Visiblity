macroScript ChangeVisiblity
category:"[VISCO]"
toolTip:"Change Visiblity"
buttontext:"CH"
icon:#("AtmosApp", 1)
(
	on execute do
	(
		a = -0.2
		if(keyboard.shiftPressed) do a = 1.0		
				
		for g in selection do (
			try(
				try(g.visibility.controller)catch(g.visibility = bezier_float())
				print (g.visibility.controller.value)
				n = g.visibility.controller.value + a
				
				if(n < 0.1) do n = 0.1
				if(n > 1) do n = 1.0
				
				g.visibility = false				
				g.visibility.controller.value = n	
			) catch()
		)
		
		disableSceneRedraw()
		completeRedraw()
		enableSceneRedraw()
		forceCompleteRedraw()
	)
)

rollout rNotify "Installed Success!" 
(		
	dotNetControl edtStat "System.Windows.Forms.Textbox" width:350 height:310 align:#center 
			
	button btnCopy "Copy" align: #left width: 50 across: 3
	button btnScriptHelp "Help" width: 50 align: #right tooltip: "Help is not available for this script" enabled: false offset: [-110, 0]	
	button btnOK "Ok" align: #right  width: 50
		
	fn initTextBox textBox =
	(
		b = (colorMan.getColor #background) * 255
		t = (colorMan.getColor #text) * 255
		
		textBox.Font = dotNetObject "System.Drawing.Font" "MS Sans Serif" 8 ((dotNetClass "System.Drawing.FontStyle").Regular)
		textBox.BorderStyle = (dotNetClass "System.Windows.Forms.BorderStyle").FixedSingle
		textBox.BackColor = (dotNetClass "System.Drawing.Color").fromARGB (b[1] as integer) (b[2] as integer) (b[3] as integer)
		textBox.ForeColor = (dotNetClass "System.Drawing.Color").fromARGB (t[1] as integer) (t[2] as integer) (t[3] as integer)
		textBox.MultiLine = true
		textBox.WordWrap = true
		textBox.ScrollBars = (dotNetClass "System.Windows.Forms.ScrollBars").Vertical
		textBox.ReadOnly = true
	)	
		
	on btnOK pressed do try(DestroyDialog rNotify)catch()
	on btnCopy pressed do setClipBoardText edtStat.text	
		
	on rNotify open do
	(					
		initTextBox edtStat
		
		s = "\r\n\r\n___________________________________________________\r\n\r\n"
		m = ""
		m += "\r\nChange Visiblity"
		m += s
		m += "For add button on tool bar:\r\n"
		m += "\r\n1. Go to \"Customize\""
		m += "\r\n2. Choose \"Customize User Interface\""
		m += "\r\n3. Choose tab \"Toolbars\""
		m += "\r\n4. Select category \"[VISCO]\" in the end of list"
		m += "\r\n5. Drag&Drop \"ChangeVisiblity\" to your tool bar"
		m += s
		m += "Quick guide:\r\n\r\n"
		m += "CLICK - make selected objects more transparent\r\n"
		m += "SHIFT+CLICK - reset for selected objects"
		m += s

		edtStat.text = m				
	)
		
)

createDialog rNotify 350 350