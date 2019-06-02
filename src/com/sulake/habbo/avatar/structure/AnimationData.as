package com.sulake.habbo.avatar.structure
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.animation.AnimationAction;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import com.sulake.habbo.avatar.structure.parts.*;

    public class AnimationData implements IFigureSetData 
    {
        private var _actions:Dictionary;

        public function AnimationData()
        {
            this._actions = new Dictionary();
        }

        public function parse(k:XML):Boolean
        {
            var _local_2:XML;
            if (k == null)
            {
                return false;
            }
            for each (_local_2 in k.action)
            {
                this._actions[String(_local_2.@id)] = new AnimationAction(_local_2);
            }
            return true;
        }

        public function _Str_1017(k:XML):Boolean
        {
            var _local_2:XML;
            if (k == null)
            {
                return false;
            }
            for each (_local_2 in k.action)
            {
                this._actions[String(_local_2.@id)] = new AnimationAction(_local_2);
            }
            return true;
        }

        public function getAction(k:IActionDefinition):AnimationAction
        {
            return this._actions[k.id];
        }

        public function getFrameCount(k:IActionDefinition):int
        {
            var _local_2:AnimationAction = this.getAction(k);
            if (!_local_2)
            {
                return 0;
            }
            return _local_2._Str_2185;
        }
    }
}
