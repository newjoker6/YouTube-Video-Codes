using Godot;
using Godot.NativeInterop;
using System;

public partial class node_2d : Node2D
{
	Vector2[] CurrentPath;
	public override void _Process(double delta)
	{
		if (Input.IsMouseButtonPressed(MouseButton.Left))
		{
			Vector2 FromPos = GetNode<Sprite2D>("Sprite2D").Position;
			Vector2 ToPos = GetGlobalMousePosition();
			Rid NavMap = GetWorld2D().NavigationMap;
			CurrentPath = NavigationServer2D.MapGetPath(NavMap, FromPos, ToPos, false);
			GetNode<Line2D>("Line2D").ClearPoints();
			Move(CurrentPath);

        }
	}

	public void Move(Vector2[] Path)
	{
		foreach (Vector2 p in Path)
		{
            GetNode<Line2D>("Line2D").AddPoint(p);
			GetNode<Line2D>("Line2D").DefaultColor = new Color(1,0,0);
			GetNode<Line2D>("Line2D").Width = 5;
        }
		
	}
}
