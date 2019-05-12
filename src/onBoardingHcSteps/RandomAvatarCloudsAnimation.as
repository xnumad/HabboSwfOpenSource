package onBoardingHcSteps
{
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import onBoardingHcSteps.images.*;

    public class RandomAvatarCloudsAnimation extends Sprite 
    {
        private static const cloud_1_1_png:Class = RandomAvatarCloudsAnimation_cloud_1_1_png;
        private static const cloud_1_2_png:Class = RandomAvatarCloudsAnimation_cloud_1_2_png;
        private static const cloud_1_3_png:Class = RandomAvatarCloudsAnimation_cloud_1_3_png;
        private static const cloud_1_4_png:Class = RandomAvatarCloudsAnimation_cloud_1_4_png;
        private static const cloud_2_1_png:Class = RandomAvatarCloudsAnimation_cloud_2_1_png;
        private static const cloud_2_2_png:Class = RandomAvatarCloudsAnimation_cloud_2_2_png;
        private static const cloud_2_3_png:Class = RandomAvatarCloudsAnimation_cloud_2_3_png;
        private static const cloud_2_4_png:Class = RandomAvatarCloudsAnimation_cloud_2_4_png;
        private static const cloud_3_1_png:Class = RandomAvatarCloudsAnimation_cloud_3_1_png;
        private static const cloud_3_2_png:Class = RandomAvatarCloudsAnimation_cloud_3_2_png;
        private static const cloud_3_3_png:Class = RandomAvatarCloudsAnimation_cloud_3_3_png;
        private static const cloud_3_4_png:Class = RandomAvatarCloudsAnimation_cloud_3_4_png;
        private static const cloud_4_1_png:Class = RandomAvatarCloudsAnimation_cloud_4_1_png;
        private static const cloud_4_2_png:Class = RandomAvatarCloudsAnimation_cloud_4_2_png;
        private static const cloud_4_3_png:Class = RandomAvatarCloudsAnimation_cloud_4_3_png;
        private static const cloud_4_4_png:Class = RandomAvatarCloudsAnimation_cloud_4_4_png;

        private var _leftFrames:Array;
        private var _rightFrames:Array;
        private var _downFrames:Array;
        private var _altFrames:Array;
        private var _animateTimer:Timer;
        private var _animationCounter:int;
        private var _animationFrame:int;
        private var _cloudLeft:Sprite;
        private var _cloudRight:Sprite;
        private var _cloudDown:Sprite;
        private var _postions:Array;
        private var _randomMove:int;

        public function RandomAvatarCloudsAnimation()
        {
            this._postions = [-9, -8, -5, -3, 3, 5, 8, 9];
            super();
            this._rightFrames = [new cloud_1_1_png(), new cloud_1_2_png(), new cloud_1_3_png(), new cloud_1_4_png()];
            this._leftFrames = [new cloud_2_1_png(), new cloud_2_2_png(), new cloud_2_3_png(), new cloud_2_4_png()];
            this._downFrames = [new cloud_3_1_png(), new cloud_3_2_png(), new cloud_3_3_png(), new cloud_3_4_png()];
            this._altFrames = [new cloud_4_1_png(), new cloud_4_2_png(), new cloud_4_3_png(), new cloud_4_4_png()];
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }

        private function dispose():void
        {
            if (this._animateTimer)
            {
                this._animateTimer.reset();
                this._animateTimer = null;
            }
            while (numChildren > 0)
            {
                removeChildAt(0);
            }
        }

        protected function onAddedToStage(k:Event):void
        {
            this._cloudDown = new Sprite();
            addChild(this._cloudDown);
            this._cloudLeft = new Sprite();
            addChild(this._cloudLeft);
            this._cloudRight = new Sprite();
            addChild(this._cloudRight);
            this._Str_1435();
        }

        private function _Str_1435():void
        {
            this._animationCounter = 0;
            this._animationFrame = 0;
            this._cloudDown.addChild(this._downFrames[0]);
            this._cloudDown.x = 75;
            this._cloudDown.y = 140;
            this._cloudLeft.addChild(this._leftFrames[0]);
            this._cloudLeft.x = 30;
            this._cloudLeft.y = 115;
            this._cloudRight.addChild(this._rightFrames[0]);
            this._cloudRight.x = 85;
            this._cloudRight.y = 110;
            this._cloudDown.visible = true;
            this._cloudLeft.visible = true;
            this._cloudRight.visible = true;
        }

        public function _Str_1480():void
        {
            this._Str_1435();
            if (!this._animateTimer)
            {
                this._animateTimer = new Timer(80);
                this._animateTimer.addEventListener(TimerEvent.TIMER, this._Str_1390);
            }
            var k:int = int(Math.round((Math.random() * (this._postions.length - 1))));
            this._randomMove = this._postions[k];
            this._animateTimer.start();
        }

        private function _Str_1390(k:TimerEvent):void
        {
            if (this._animateTimer == null)
            {
                return;
            }
            this._animationCounter++;
            if (((this._animationCounter > 2) && (this._animationCounter < 5)))
            {
                this._animationFrame = 1;
            }
            else
            {
                if (((this._animationCounter > 4) && (this._animationCounter < 7)))
                {
                    this._animationFrame = 2;
                }
                else
                {
                    if (((this._animationCounter > 6) && (this._animationCounter < 9)))
                    {
                        this._animationFrame = 3;
                    }
                    else
                    {
                        if (this._animationCounter >= 9)
                        {
                            this._cloudDown.visible = false;
                            this._cloudLeft.visible = false;
                            this._cloudRight.visible = false;
                        }
                    }
                }
            }
            this._cloudDown.removeChildAt(0);
            this._cloudLeft.removeChildAt(0);
            this._cloudRight.removeChildAt(0);
            this._cloudDown.addChild(this._downFrames[this._animationFrame]);
            this._cloudLeft.addChild(this._leftFrames[this._animationFrame]);
            this._cloudRight.addChild(this._rightFrames[this._animationFrame]);
            var _local_2:int = int(Math.round((Math.random() * 10)));
            if ((_local_2 % 2) != 0)
            {
                this._cloudRight.removeChildAt(0);
                this._cloudRight.addChild(this._altFrames[this._animationFrame]);
            }
            else
            {
                this._cloudDown.removeChildAt(0);
                this._cloudDown.addChild(this._altFrames[this._animationFrame]);
            }
            if (this._animationCounter <= 9)
            {
                this._cloudRight.x = (this._cloudRight.x + (10 + (Math.random() * 5)));
                this._cloudRight.y = (this._cloudRight.y - this._randomMove);
                this._cloudLeft.x = (this._cloudLeft.x - (10 + (Math.random() * 5)));
                this._cloudLeft.y = (this._cloudLeft.y - this._randomMove);
                this._cloudDown.y = (this._cloudDown.y + (this._randomMove * 1.3));
            }
        }
    }
}
