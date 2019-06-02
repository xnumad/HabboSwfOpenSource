//com.sulake.habbo.avatar.structure.PartSetsData

package com.sulake.habbo.avatar.structure{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import com.sulake.habbo.avatar.structure.parts.PartDefinition;
    import com.sulake.habbo.avatar.actions.ActionDefinition;
    import com.sulake.habbo.avatar.structure.parts.ActivePartSet;

    public class PartSetsData implements IStructureData {

        private var _parts:Dictionary;
        private var _activePartSets:Dictionary;

        public function PartSetsData();

        public function parse(k:XML):Boolean;

        public function appendXML(k:XML):Boolean;

        public function getActiveParts(k:IActionDefinition):Array;

        public function getPartDefinition(k:String):PartDefinition;

        public function addPartDefinition(k:XML):PartDefinition;

        public function get parts():Dictionary;

        public function get activePartSets():Dictionary;

        public function getActivePartSet(k:ActionDefinition):ActivePartSet;


    }
}//package com.sulake.habbo.avatar.structure

