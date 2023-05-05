// Auto-generated. Do not edit!

// (in-package instance_segmentation_depth.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Result {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.class_names = null;
      this.masks = null;
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
      if (initObj.hasOwnProperty('masks')) {
        this.masks = initObj.masks
      }
      else {
        this.masks = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Result
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [class_names]
    bufferOffset = _arraySerializer.string(obj.class_names, buffer, bufferOffset, null);
    // Serialize message field [masks]
    // Serialize the length for message field [masks]
    bufferOffset = _serializer.uint32(obj.masks.length, buffer, bufferOffset);
    obj.masks.forEach((val) => {
      bufferOffset = sensor_msgs.msg.Image.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Result
    let len;
    let data = new Result(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [class_names]
    data.class_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [masks]
    // Deserialize array length for message field [masks]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.masks = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.masks[i] = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.class_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.masks.forEach((val) => {
      length += sensor_msgs.msg.Image.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'instance_segmentation_depth/Result';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '14ec78ad8ff0eaa43922915861c4a71f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    # Bounding boxes in pixels
    #sensor_msgs/RegionOfInterest[] boxes
    
    # String class IDs for each bouding box
    string[] class_names
    
    # Float probability scores of the class_id
    #float32[] scores
    
    # Instance masks as Image
    sensor_msgs/Image[] masks
    
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
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Result(null);
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

    if (msg.masks !== undefined) {
      resolved.masks = new Array(msg.masks.length);
      for (let i = 0; i < resolved.masks.length; ++i) {
        resolved.masks[i] = sensor_msgs.msg.Image.Resolve(msg.masks[i]);
      }
    }
    else {
      resolved.masks = []
    }

    return resolved;
    }
};

module.exports = Result;
