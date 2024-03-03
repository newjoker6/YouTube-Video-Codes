using Godot;
using System;
using GC = Godot.Collections;

public partial class SpreadsheetLoad : Control
{
	String Path = "res://demo.csv";
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GC.Dictionary dataTable = GetData(Path);
		tableData(dataTable);
	}

	public GC.Dictionary GetData(String path)
	{
		GC.Dictionary mainData = new GC.Dictionary();
		FileAccess f = FileAccess.Open(path, FileAccess.ModeFlags.Read);
		while (!f.EofReached())
		{
			GC.Array dataSet = new GC.Array {f.GetCsvLine()};
			mainData[mainData.Count] = dataSet;
		}
		f.Close();
		mainData.Remove(mainData.Count - 1);
		return mainData;

	}

	public void tableData(GC.Dictionary newData)
	{
		GridContainer Table = GetNode<GridContainer>("GridContainer");
		foreach (var kvp in newData)
		{
			foreach (var item in kvp.Value.AsGodotArray())
			{
				foreach (var subitem in item.AsGodotArray())
				{
					Label L = new Label();
					L.Text = subitem.ToString();
					Table.AddChild(L);
				}
			}
		}
	}
}
