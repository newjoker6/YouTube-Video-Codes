using Godot;
using System;
using System.Threading.Tasks;

public partial class text_manager : Control
{
	[Export]
	new_script myref;
	// Called when the node enters the scene tree for the first time.
	public override async void _Ready()
	{
		await Task.Delay(16);
		GD.Print("is done");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public async void myfunc()
	{
		GD.Print("asdf");
    }
}
