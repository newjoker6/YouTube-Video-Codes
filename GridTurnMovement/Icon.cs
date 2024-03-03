using Godot;
using System;

public partial class Icon : Sprite2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if (Input.IsActionJustPressed("ui_up"))
		{
            this.Rotation = Vector2.Up.Angle();
        }
        else if (Input.IsActionJustPressed("ui_down"))
        {
            this.Rotation = Vector2.Down.Angle();
        }

        else if (Input.IsActionJustPressed("ui_left"))
        {
            this.Rotation = Vector2.Left.Angle();
        }
        else if (Input.IsActionJustPressed("ui_right"))
        {
            this.Rotation = Vector2.Right.Angle();
        }
    }
}
