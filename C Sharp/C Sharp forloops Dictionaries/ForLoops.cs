using Godot;
using System;

public class ForLoops : Control
{
    [Export]
    public Godot.Collections.Dictionary AuctionBids = new Godot.Collections.Dictionary{};

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
        DictionaryLearning();
        SelectWinner(AuctionBids);

    }

    public void DictionaryLearning()
    {
        // add key value to dictionaryss
        AuctionBids["Jim"] = 10;
        AuctionBids.Add("Johnny", 50);
        AuctionBids["Joey"] = 80;
        AuctionBids["Duck"] = 150;
        AuctionBids["Hal"] = 45;
        
        // remove key from dictionary
        // AuctionBids.Remove("Jim");

        // check if key in dictionary
        if (AuctionBids.Contains("Jim"))
        {
            GD.Print("Found It");
        }
    }

    public void forlooptest()
    {
        for (int i = 0; i < 5; i++)
        {
            GD.Print(i);
        }

        foreach (String i in AuctionBids.Keys)
        {
            GD.Print(i);
        }
    }

    public void SelectWinner(Godot.Collections.Dictionary bidders)
    {
        int HighestBid = 0;
        String HighestBidder = "";

        foreach (String i in bidders.Keys)
        {
            if (HighestBid < (int)bidders[i])
            {
                HighestBid = (int)bidders[i];
                HighestBidder = i;
            }
        }

        GetNode<Label>("Label").Text = "Highest Bid: " + HighestBid + " Highest Bidder: " + HighestBidder;
    }
}

