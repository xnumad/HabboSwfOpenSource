package snowwar._Str_231
{
	import com.sulake.core.utils.Map;
	import com.sulake.core.runtime.exceptions.Exception;
    import snowwar._Str_254._SafeStr_4669;
    import snowwar._Str_39.HumanGameObject;

    public class SynchronizedGameStage extends _SafeStr_4025 
    {
        protected var _gameObjects:Map;
        private var _deletedGameObjects:Array;
        private var _removedGameObjects:Array;

        public function SynchronizedGameStage()
        {
            this._gameObjects = new Map();
            this._deletedGameObjects = [];
            this._removedGameObjects = [];
            super();
        }

        private static function intToDoubleDigitsString(num:int):String
        {
            if (num < 10)
            {
                return "0" + num;
            }
            return num.toString();
        }


        override public function dispose():void
        {
            var gameObject:ISnowWarGameObject;
            super.dispose();
            if (this._gameObjects != null)
            {
                for each (gameObject in this._gameObjects)
                {
                    gameObject.dispose();
                }
                this._gameObjects.dispose();
                this._gameObjects = null;
            }
            this._deletedGameObjects = [];
            this._removedGameObjects = [];
        }

        public function addActiveGameObject(k:int, gameObject:ISnowWarGameObject):void
        {
            this._gameObjects.add(k, gameObject);
            gameObject.isActive = true;
        }

        public function addInactiveGameObject(k:int, gameObject:ISnowWarGameObject):void
        {
            this._gameObjects.add(k, gameObject);
            gameObject.isActive = false;
        }

        public function _SafeStr_18708(id:int, gameObject:ISnowWarGameObject):void
        {
            this._gameObjects.add(id, gameObject);
            gameObject.isActive = true;
            if (gameObject._SafeStr_13236 != id)
            {
                throw (new Exception(("Could not add gameobject with id:" + id)));
            }
        }

        public function removeGameObject(id:int):void
        {
            var gameObject:ISnowWarGameObject = this._gameObjects.remove(id);
            if (gameObject)
            {
                gameObject.onRemove();
                this._removedGameObjects.push(gameObject);
            }
        }

        public function _SafeStr_18709():void
        {
            var gameObject:ISnowWarGameObject;
            for each (gameObject in this._gameObjects.getValues())
            {
                gameObject.onRemove();
                this._removedGameObjects.push(gameObject);
            }
            this._gameObjects = new Map();
        }

        public function _SafeStr_18710(gameObject:ISnowWarGameObject):void
        {
            if (gameObject == null)
            {
                HabboGamesCom.log("Trying to put null in delete list.");
                return;
            }
            this._deletedGameObjects.push(gameObject);
            gameObject.isActive = false;
        }

        public function getGameObject(id:int):ISnowWarGameObject
        {
            return this._gameObjects.getValue(id) as ISnowWarGameObject;
        }

        public function _SafeStr_18711():Array
        {
            return this._gameObjects.getValues();
        }

        public function subturn():void
        {
            var gameObject:ISnowWarGameObject;
            var deletedObject:_SafeStr_4028;
            for each (gameObject in this._gameObjects.getValues())
            {
                gameObject.subturn(this);
            }
            if (this._deletedGameObjects.length > 0)
            {
                for each (deletedObject in this._deletedGameObjects)
                {
                    this.removeGameObject(deletedObject._SafeStr_13236);
                }
                this._deletedGameObjects = [];
            }
        }

        public function _SafeStr_18712(turn:int):int
        {
            var gameObject:ISnowWarGameObject;
            var _local_8:int;
            var variableCount:int;
            var count:int;
            var checkSum:int = _SafeStr_4669._SafeStr_18715(turn);
            var _local_4:int;
            var logString:String = "";
            var parms:String = "";
            if (HabboGamesCom.logEnabled)
            {
                logString = "";
                logString = (logString + (("\nturn ### " + turn) + " ###\n"));
                logString = (logString + (("seed " + checkSum) + "\n"));
                parms = "";
            }
            for each (gameObject in this._gameObjects)
            {
                if (((gameObject._SafeStr_18700) && (gameObject is HumanGameObject)))
                {
                    HumanGameObject(gameObject)._SafeStr_13262(turn);
                }
                else
                {
                    if (((!(gameObject.isActive)) || (gameObject._SafeStr_18700)))
                    {
                    }
                    else
                    {
                        _local_8 = 1;
                        variableCount = gameObject.numberOfVariables;
                        count = 0;
                        while (count < variableCount)
                        {
                            checkSum = (checkSum + (gameObject.getVariable(count) * _local_8));
                            _local_8++;
                            if (HabboGamesCom.logEnabled)
                            {
                                parms = (parms + gameObject.getVariable(count));
                                if (count < (variableCount - 1))
                                {
                                    parms = (parms + ",");
                                }
                            }
                            count++;
                        }
                        if (HabboGamesCom.logEnabled)
                        {
                            logString = (logString + (((((('++ "O' + intToDoubleDigitsString((_local_4 + 1))) + "-CS:") + checkSum) + " Parms:") + parms) + '"\n'));
                            parms = "";
                            _local_4++;
                        }
                    }
                }
            }
            HabboGamesCom.log(logString);
            return checkSum;
        }

        public function _SafeStr_18713(k:Object):void
        {
            var _local_3:ISnowWarGameObject;
            var _local_2:int;
            for each (_local_3 in this._gameObjects.getValues())
            {
                if (_local_3.isActive)
                {
                    _local_2++;
                }
            }
            k.writeInt(_local_2);
            for each (_local_3 in this._gameObjects.getValues())
            {
                if (_local_3.isActive)
                {
                }
            }
        }

        public function resetRemovedGameObjects():Array
        {
            var k:Array = this._removedGameObjects;
            this._removedGameObjects = [];
            return k;
        }
    }
}
