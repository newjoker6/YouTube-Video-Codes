using Godot;
using System;

public partial class character : RigidBody2D
{
    Vector2 Destination;
    const int Speed = 500;

    void set_destination(Vector2 NewDestination)
    {
        Destination = NewDestination;
        GetNode<NavigationAgent2D>("NavigationAgent2D").TargetPosition = Destination;
    }

    public override void _IntegrateForces(PhysicsDirectBodyState2D state)
    {
        if (GetNode<NavigationAgent2D>("NavigationAgent2D").IsTargetReachable())
        {
            var Target = GetNode<NavigationAgent2D>("NavigationAgent2D").GetNextPathPosition();
            var velocity = Position.DirectionTo(Target).Normalized() * Speed;
            GetNode<NavigationAgent2D>("NavigationAgent2D").SetVelocity(velocity);
        }
        else
        {
            LinearVelocity = Vector2.Zero;
        }
    }

    public void _on_navigation_agent_2d_velocity_computed(Vector2 SafeVelocity)
    {
        LinearVelocity = SafeVelocity;
    }
}
