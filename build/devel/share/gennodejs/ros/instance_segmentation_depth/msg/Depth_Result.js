// Auto-generated. Do not edit!

// (in-package instance_segmentation_depth.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Depth_Result {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.class_names = null;
      this.depths = null;
      this.size = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('class_names')) {
        this.class_names = initObj.class_names
      }
      else {
        this.class_names = [];
      }
      if (initObj.hasOwnProperty('depths')) {
        this.depths = initObj.depths
      }
      else {
        this.depths = [];
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Depth_Result
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [class_names]
    bufferOffset = _arraySerializer.string(obj.class_names, buffer, bufferOffset, null);
    // Serialize message field [depths]
    bufferOffset = _arraySerializer.float32(obj.depths, buffer, bufferOffset, null);
    // Serialize message field [size]
    bufferOffset = _arraySerializer.float32(obj.size, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Depth_Result
    let len;
    let data = new Depth_Result(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [class_names]
    data.class_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [depths]
    data.depths = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [size]
    data.size = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.class_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 4 * object.depths.length;
    length += 4 * object.size.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'instance_segmentation_depth/Depth_Result';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8c769a6dc22d14b3306fcf937008cfe3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    # String class IDs for each object
    string[] class_names
    
    # depths of each object
    float32[] depths
    
    # size of each object
    float32[] size
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Depth_Result(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.class_names !== undefined) {
      resolved.class_names = msg.class_names;
    }
    else {
      resolved.class_names = []
    }

    if (msg.depths !== undefined) {
      resolved.depths = msg.depths;
    }
    else {
      resolved.depths = []
    }

    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = []
    }

    return resolved;
    }
};

module.exports = Depth_Result;
