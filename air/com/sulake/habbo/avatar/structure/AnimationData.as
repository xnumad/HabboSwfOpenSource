//com.sulake.habbo.avatar.structure.AnimationData

package com.sulake.habbo.avatar.structure{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import com.sulake.habbo.avatar.structure.animation.AnimationAction;

    public class AnimationData implements IStructureData {

        private var _actions:Dictionary;

        public function AnimationData();

        public function parse(k:XML):Boolean;

        public function appendXML(k:XML):Boolean;

        public function getAction(k:IActionDefinition):AnimationAction;

        public function getFrameCount(k:IActionDefinition):int;


    }
}//package com.sulake.habbo.avatar.structure

