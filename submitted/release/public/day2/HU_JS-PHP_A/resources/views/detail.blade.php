@extends('menu')

@section('left')
    <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="{{ @route('events') }}">Manage Events</a></li>
    </ul>

    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
        <span>{{ $event->name }}</span>
    </h6>
    <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link active" href="{{ @route('detail', ['event' => $event->id]) }}">Overview</a></li>
    </ul>

    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
        <span>Reports</span>
    </h6>
    <ul class="nav flex-column mb-2">
        <li class="nav-item"><a class="nav-link" href="#">Room capacity</a></li>
    </ul>
@endsection

@section('right')
    <div class="border-bottom mb-3 pt-3 pb-2 event-title">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
            <h1 class="h2">{{ $event->name }}</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group mr-2">
                    <a href="{{ @route('edit', ['event' => $event->id]) }}" class="btn btn-sm btn-outline-secondary">Edit event</a>
                </div>
            </div>
        </div>
        <span class="h6">{{ $event->date }}</span>
    </div>

    @if(request()->has('message'))
        <div class="alert alert-success">
            {{ request()->get('message') }}
        </div>
    @endif

    <!-- Tickets -->
    <div id="tickets" class="mb-3 pt-3 pb-2">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
            <h2 class="h4">Tickets</h2>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group mr-2">
                    <a href="{{ @route('tickets', ['event' => $event->id]) }}" class="btn btn-sm btn-outline-secondary">
                        Create new ticket
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row tickets">
        @foreach($event->tickets as $ticket)
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">{{ $ticket->name }}</h5>
                    <p class="card-text">{{ $ticket->cost }}.-</p>
                    <p class="card-text">{{ $ticket->description }}&nbsp;</p>
                </div>
            </div>
        </div>
        @endforeach
    </div>

    <!-- Sessions -->
    <div id="sessions" class="mb-3 pt-3 pb-2">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
            <h2 class="h4">Sessions</h2>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group mr-2">
                    <a href="{{ @route('sessions', ['event' => $event->id]) }}" class="btn btn-sm btn-outline-secondary">
                        Create new session
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="table-responsive sessions">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Time</th>
                <th>Type</th>
                <th class="w-100">Title</th>
                <th>Speaker</th>
                <th>Channel</th>
            </tr>
            </thead>
            <tbody>
            @foreach($event->channels as $channel)
                @foreach($channel->rooms as $room)
                    @foreach($room->sessions as $session)
                        <tr>
                            <td class="text-nowrap">{{ $session->start_time }} - {{ $session->end_time }}</td>
                            <td>{{ $session->type }}</td>
                            <td><a href="{{ @route('sessions', ['event' => $event->id]) }}">{{ $session->title }}</a></td>
                            <td class="text-nowrap">{{ $session->speaker }}</td>
                            <td class="text-nowrap">{{ $channel->name }} / {{ $room->name }}</td>
                        </tr>
                    @endforeach
                @endforeach
            @endforeach
            </tbody>
        </table>
    </div>

    <!-- Channels -->
    <div id="channels" class="mb-3 pt-3 pb-2">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
            <h2 class="h4">Channels</h2>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group mr-2">
                    <a href="{{ @route('channels', ['event' => $event->id]) }}" class="btn btn-sm btn-outline-secondary">
                        Create new channel
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row channels">
        @foreach($event->channels as $channel)
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">{{ $channel->name }}</h5>
                    <p class="card-text">
                        {{ $channel->sessions_count }} sessions,
                        {{ count($channel->rooms) }} room
                    </p>
                </div>
            </div>
        </div>
        @endforeach
    </div>

    <!-- Rooms -->
    <div id="rooms" class="mb-3 pt-3 pb-2">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
            <h2 class="h4">Rooms</h2>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="btn-group mr-2">
                    <a href="{{ @route('rooms', ['event' => $event->id]) }}" class="btn btn-sm btn-outline-secondary">
                        Create new room
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="table-responsive rooms">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Capacity</th>
            </tr>
            </thead>
            <tbody>
            @foreach($event->channels as $channel)
                @foreach($channel->rooms as $room)
                    <tr>
                        <td>{{ $room->name }}</td>
                        <td>{{ $room->capacity }}</td>
                    </tr>
                @endforeach
            @endforeach
            </tbody>
        </table>
    </div>
@endsection
