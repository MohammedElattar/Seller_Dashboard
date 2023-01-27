<?php

namespace App\Events;

use App\Model\Chatting;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MessageSent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * Message details
     *
     * @var Chatting
     */
    public $message;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Chatting $message)
    {
        //

        $this->message = $message;
    }

    public function broadcastOn()
    {
        return new PrivateChannel('everest22');
    }
    public function broadcastAs()
    {
        return 'everest22';
    }
}
