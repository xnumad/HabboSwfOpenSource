package snowwar._Str_231
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.core.utils.Map;
	import snowwar.SnowWarEngine;
	import snowwar.SnowWarGameStage;

    public class SynchronizedGameArena implements IDisposable 
    {
        private var _snowWarEngine:SnowWarEngine;
        private var _events:Array;
        protected var turn:int;
        private var _subturn:int;
        private var _SafeStr_19001:int = 1;
        private var _synchronizedGameStage:SynchronizedGameStage;
        private var _extension:_SafeStr_4033;
        private var _checksums:Map;
        private var _disposed:Boolean = false;
        private var _newTurn:Boolean = false;
        private var _SafeStr_18581:int;
        private var _SafeStr_19006:Array;
		
        public function dispose():void
        {
            this._disposed = true;
            this._snowWarEngine = null;
            this._events = null;
            this._synchronizedGameStage = null;
            if (this._extension != null)
            {
                this._extension.dispose();
                this._extension = null;
            }
            this._checksums = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function initialize(k:SnowWarEngine, _arg_2:int):void
        {
            this._snowWarEngine = k;
            this._synchronizedGameStage = new SnowWarGameStage();
            this._checksums = new Map();
            this._events = [];
            this._SafeStr_18581 = _arg_2;
            this.turn = 0;
            this._subturn = 0;
            this._events[this.turn] = this.generateEventsList();
            this._checksums = new Map();
            this._SafeStr_19010();
        }

        public function get snowWarEngine():SnowWarEngine
        {
            return this._snowWarEngine;
        }

        public function handleTurn():void
        {
            this.gameTurn();
        }

        public function gameTurn():void
        {
            var events:Array;
            var event:_SafeStr_4019;
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((("Turn " + this.turn) + " subturn ") + (this._subturn + 1)) + "/") + this.maxSubTurns()));
            }
            var stage:SynchronizedGameStage = SynchronizedGameStage(this.synchronizedGameStage());
            var turnEvents:Array = this._events[this.turn];
            if (turnEvents)
            {
                events = turnEvents[this._subturn];
                while (events.length > 0)
                {
                    event = (events.shift() as _SafeStr_4019);
                    if (HabboGamesCom.logEnabled)
                    {
                        HabboGamesCom.log(((((((("GameInstance::gameTurn: applying event " + event) + " turn ") + this.turn) + " subturn ") + (this._subturn + 1)) + "/") + this.maxSubTurns()));
                    }
                    event.apply(stage);
                }
            }
            if (!this._newTurn)
            {
                stage.subturn();
            }
            if (this._subturn >= (this.maxSubTurns() - 1))
            {
                if ((this.turn % this._SafeStr_19001) == 0)
                {
                    this._checksums[this.turn] = this.synchronizedGameStage()._SafeStr_18712(this.turn);
                }
                this.turn++;
                this._newTurn = false;
                if (HabboGamesCom.logEnabled)
                {
                    HabboGamesCom.log(("Turn:" + this.turn));
                }
            }
            this._subturn++;
            if (this._subturn >= this.maxSubTurns())
            {
                this._subturn = 0;
            }
        }

        public function addGameEvent(turn:int, subturn:int, event:_SafeStr_4019):void
        {
            var eventsList:Array = this._events[turn];
            if (eventsList == null)
            {
                eventsList = this.generateEventsList();
                this._events[turn] = eventsList;
            }
            eventsList[subturn].push(event);
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((("Add game event: " + event) + " (subturn/turn): ") + subturn) + "/") + turn));
            }
        }

        public function _SafeStr_19008():void
        {
            var _local_3:Array;
            var _local_4:int;
            var _local_5:Array;
            var _local_6:_SafeStr_4019;
            var k:String = "";
            var _local_2:int;
            while (_local_2 < this._events.length)
            {
                _local_3 = this._events[_local_2];
                if (_local_3 == null)
                {
                }
                else
                {
                    _local_4 = 0;
                    while (_local_4 < this.maxSubTurns())
                    {
                        _local_5 = _local_3[_local_4];
                        if (_local_5.length == 0)
                        {
                        }
                        else
                        {
                            k = (k + (((_local_2 + " (") + _local_4) + ") : "));
                            for each (_local_6 in _local_5)
                            {
                                k = (k + _local_6);
                            }
                            k = (k + "\n");
                        }
                        _local_4++;
                    }
                }
                _local_2++;
            }
            HabboGamesCom.log(k);
        }

        public function maxSubTurns():int
        {
            return this.getExtension().maxSubTurns();
        }

        public function getTurn():int //_SafeStr_13240
        {
            return this.turn;
        }

        public function get subturn():int
        {
            return this._subturn;
        }

        public function synchronizedGameStage():SynchronizedGameStage //synchronizedGameStage
        {
            return this._synchronizedGameStage;
        }

        public function getExtension():_SafeStr_4033
        {
            return this._extension;
        }

        public function registerExtension(k:_SafeStr_4033):void
        {
            this._extension = k;
            k.synchronizedGameArena = this;
        }

        public function _SafeStr_13254(k:int):int
        {
            return this._checksums[k]; // this._SafeStr_19004[k];
        }

        public function newTurn(turn:int, checkSum:int):void
        {
            this.turn = turn;
            this._subturn = 0;
            this._checksums[this.turn] = checkSum;
            this._events = [];
            this._events[this.turn] = this.generateEventsList();
            this._newTurn = true;
        }

        private function generateEventsList():Array
        {
            var events:Array = [];
            var turn:int;
            while (turn < this.maxSubTurns())
            {
                events[turn] = [];
                turn++;
            }
            return events;
        }

        public function get _SafeStr_13274():int
        {
            return this._SafeStr_18581;
        }

        private function _SafeStr_19010():void
        {
            this._SafeStr_19006 = [];
            var k:int;
            while (k < this._SafeStr_18581)
            {
                this._SafeStr_19006[k] = 0;
                k++;
            }
        }

        public function _SafeStr_18855(k:int, _arg_2:int):void
        {
            if (((k > 0) && (k <= this._SafeStr_18581)))
            {
                this._SafeStr_19006[(k - 1)] = (this._SafeStr_19006[(k - 1)] + _arg_2);
            }
        }

        public function _SafeStr_19011():Array
        {
            return this._SafeStr_19006;
        }
    }
}
