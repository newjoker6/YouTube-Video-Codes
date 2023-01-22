using Godot;
using System;
using System.Collections.Generic;

public class Control : Godot.Control
{
	public int Speed = 5;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		connectSignals();
	}
	
	private void connectSignals()
	{
		GetNode<Button>("MyButton").Connect("pressed", this, nameof(buttonPressed));
	}
	
	public void buttonPressed()
	{
		var T = GetNode<LineEdit>("LineEdit").Text;
		GetNode<LineEdit>("LineEdit").Clear();
		GetNode<Label>("Label").Text = T;
	}
}
