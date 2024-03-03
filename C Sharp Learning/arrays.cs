using Godot;
using System;
using System.Collections.Generic;

public class arrays : Control
{
    [Export]
	int[] IntList = {5, 6, 7, 8};
	
	[Export]
	public String[] StringList = {"cheese", "potatoes", "peacock"};
	
	// cant export but can store any value type
	public object[] ObjList = {"banana", 3, 35.6};

    [Export]
	public List<String> shop = new List<String>();
	
	[Export]
	public Godot.Collections.Array shop2 = new Godot.Collections.Array();



    public Godot.Collections.Array Toppings = new Godot.Collections.Array();
    public int MaxToppingsAllowed = 3;


    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
       GetNode<Label>("toppingListDisplay").Text = "";
        connectSignals();
    }

    private void connectSignals(){
        GetNode<Button>("confirmButton").Connect("pressed", this, nameof(buttonPressed));
    }

    public void buttonPressed(){
        
        if (Toppings.Count < MaxToppingsAllowed){
        Toppings.Add(GetNode<LineEdit>("toppingEntry").Text);
        GetNode<LineEdit>("toppingEntry").Clear();
        udpateDisplay();
        }
        
    }

    public void udpateDisplay(){
        GetNode<Label>("toppingListDisplay").Text = "";

         for (int i = 0; i < Toppings.Count; i++)
        {
            GetNode<Label>("toppingListDisplay").Text += Toppings[i];
            
            if (i < Toppings.Count - 1){
                GetNode<Label>("toppingListDisplay").Text += ", ";
            }
        }
    }








    public void learningArrays()
	{
        // get size of array
        GD.Print(ObjList.Length);
        GD.Print(shop2.Count);

        // get array element
        GD.Print(ObjList[2]);
        GD.Print(shop2[0]);

        // Sort an array
		Array.Sort(StringList);
        GD.Print(StringList);

        // add and remove from arrays
        shop2.Add("cheeseburger");
        shop2.Add("hamburger");
        GD.Print(shop2);
       // shop2.Remove("hamburger");
       shop2.RemoveAt(2);
        GD.Print(shop2);

    }

}
