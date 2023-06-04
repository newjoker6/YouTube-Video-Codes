using Godot;
using System;

public partial class settersgetters : Node2D
{
	[Signal]
	public delegate void SpeedChangedEventHandler();

	int speed = 5;

	int _speed {
		get {
			return speed;
		}

		set{
			EmitSignal("SpeedChangedEventHandler");
			speed = Mathf.Clamp(value, 0, 10);
		}
}

    public override void _Ready()
	{		
		Set("_speed", 40);
		GD.Print(Get("_speed"));
	}

}
