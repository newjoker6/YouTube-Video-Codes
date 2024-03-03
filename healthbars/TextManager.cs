using Godot;
using System;

public partial class TextManager : Control
{
	[Export] LineEdit myLine;
	public void _on_line_edit_text_changed(string new_text)
	{
		myLine.Text = new_text;
		myLine.CaretColumn = myLine.Text.Length;
		
		//if (new_text[new_text.Length - 1].ToString().IsValidInt())
		//{
		//	myLine.DeleteCharAtCaret();
		//}
	}
}
