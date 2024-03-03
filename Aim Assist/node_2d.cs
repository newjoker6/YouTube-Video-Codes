using Godot;
using System;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
using GC = Godot.Collections;

public partial class node_2d : Node2D
{
	[Export]
	public Godot.Collections.Dictionary<int, test> mydict;
	public List<string> stringlist;

    [Export(PropertyHint.File, "*.txt")]
    public string myfile;


	public override void _Ready()
	{
		//mydict.TryGetValue(5, out var value);
		//GD.Print(value);
		mydict.Add(3, new test());
		if (mydict.ContainsKey(3))
		{
			var test = mydict[3];
			GD.Print(test);
        }
		//stringlist.Add((string)"meep");
		//GD.Print(mydict);


	}
}

public partial class test : Control
{
	[Export]
	Godot.Collections.Dictionary thedict = new();
}