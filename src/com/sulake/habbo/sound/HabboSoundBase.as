package com.sulake.habbo.sound
{
    import flash.media.SoundChannel;
    import flash.media.Sound;
    import flash.events.Event;
    import flash.media.SoundTransform;

    public class HabboSoundBase implements IHabboSound 
    {
        private var _soundChannel:SoundChannel = null;
        private var _complete:Boolean;
        private var _volume:Number;
        private var _loopCount:int;
        protected var _soundObject:Sound = null;

        public function HabboSoundBase(k:Sound, _arg_2:int=0)
        {
            this._soundObject = k;
            this._soundObject.addEventListener(Event.COMPLETE, this.onComplete);
            this._volume = 1;
            this._complete = false;
            this._loopCount = _arg_2;
        }

        protected function _Str_26043():Sound
        {
            return this._soundObject;
        }

        protected function _Str_15495():SoundChannel
        {
            return this._soundChannel;
        }

        protected function _Str_20695(k:SoundChannel):void
        {
            this._soundChannel = k;
        }

        protected function _Str_22198(k:Boolean):void
        {
            this._complete = k;
        }

        public function dispose():void
        {
            this.stop();
            this._soundChannel = null;
            this._soundObject = null;
        }

        public function play(k:Number=0):Boolean
        {
            this._complete = false;
            this._soundChannel = this._soundObject.play(0, this._loopCount);
            this._Str_3206 = this._volume;
            return true;
        }

        public function stop():Boolean
        {
            if (this._soundChannel)
            {
                this._soundChannel.stop();
            }
            return true;
        }

        public function get _Str_3206():Number
        {
            return this._volume;
        }

        public function set _Str_3206(k:Number):void
        {
            this._volume = k;
            this._Str_7399(k);
        }

        protected function _Str_7399(k:Number):void
        {
            if (this._soundChannel != null)
            {
                this._soundChannel.soundTransform = new SoundTransform(k);
            }
        }

        public function get position():Number
        {
            return this._soundChannel.position;
        }

        public function set position(k:Number):void
        {
        }

        public function get length():Number
        {
            return this._soundObject.length;
        }

        public function get ready():Boolean
        {
            return !(this._soundObject.isBuffering);
        }

        public function get _Str_21060():Boolean
        {
            return !(this._complete);
        }

        public function get fadeOutSeconds():Number
        {
            return 0;
        }

        public function set fadeOutSeconds(k:Number):void
        {
        }

        public function get fadeInSeconds():Number
        {
            return 0;
        }

        public function set fadeInSeconds(k:Number):void
        {
        }

        private function onComplete(k:Event):void
        {
            this._complete = true;
        }
    }
}
