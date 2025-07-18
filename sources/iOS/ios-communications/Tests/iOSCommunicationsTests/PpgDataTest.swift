//  Copyright © 2022 Polar. All rights reserved.

import XCTest
@testable import iOSCommunications

final class PpgDataTest: XCTestCase {
    
    func testRawPpgFrameType0() throws {
        // Arrange
        // HEX: 01 00 94 35 77 00 00 00 00 00
        // index                                                   data:
        // 0        type                                           01 (PPG)
        // 1..8     timestamp                                      00 94 35 77 00 00 00 00
        let timeStamp:UInt64 = 2000000000
        //9       frame type                                     00 (raw, type 0)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x00,
        ])
        let previousTimeStamp:UInt64 = 100
        let ppgDataFrameContent = Data([
            0x01, 0x02, 0x03,  //PPG0 (197121)
            0x04, 0x05, 0x06,  //PPG1 (394500)
            0xFF, 0xFF, 0x7F,  //PPG2 (8388607)
            0x00, 0x00, 0x00,  //ambient (0)
            0xFF, 0xFF, 0xFF,  //PPG0 (-1)
            0x0F, 0xEF, 0xEF,  //PPG1 (-1052913)
            0x00, 0x00, 0x80,  //PPG2 (-8388608)
            0x0F, 0xEF, 0xEF   //ambient (-1052913)
        ])
        let ppg0Sample0:Int32 = 197121
        let ppg1Sample0:Int32 = 394500
        let ppg2Sample0:Int32 = 8388607
        let ambientSample0:Int32 = 0
        let ppg0Sample1:Int32 = -1
        let ppg1Sample1:Int32 = -1052913
        let ppg2Sample1:Int32 = -8388608
        let ambientSample1:Int32 = -1052913
        
        let factor:Float = 1.0
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader + ppgDataFrameContent,
            { _,_ in previousTimeStamp },
            { _ in factor },
            { _ in 55 })

        // Act
        let result = try PpgData.parseDataFromDataFrame(frame: dataFrame)
        
        // Assert
        XCTAssertEqual(2, result.samples.count)
        XCTAssertEqual(3, result.samples[0].ppgDataSamples.count)
        XCTAssertEqual(ppg0Sample0, result.samples[0].ppgDataSamples[0])
        XCTAssertEqual(ppg1Sample0, result.samples[0].ppgDataSamples[1])
        XCTAssertEqual(ppg2Sample0, result.samples[0].ppgDataSamples[2])
        XCTAssertEqual(ambientSample0, result.samples[0].ambientSample)
        
        XCTAssertEqual(3, result.samples[1].ppgDataSamples.count)
        XCTAssertEqual(ppg0Sample1, result.samples[1].ppgDataSamples[0])
        XCTAssertEqual(ppg1Sample1, result.samples[1].ppgDataSamples[1])
        XCTAssertEqual(ppg2Sample1, result.samples[1].ppgDataSamples[2])
        XCTAssertEqual(ambientSample1, result.samples[1].ambientSample)
        
        XCTAssertEqual(timeStamp, result.timeStamp)
        XCTAssertEqual(timeStamp, result.samples.last?.timeStamp)
    }
    
    func testRawPpgFrameType4() throws {
        // Arrange
        // HEX: 01 00 94 35 77 00 00 00 00 09
        // index                                                   data:
        // 0        type                                           01 (PPG)
        // 1..8     timestamp                                      00 94 35 77 00 00 00 00
        let timeStamp:UInt64 = 2000000000
        //9       frame type                                     04 (raw, type 4)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x04,
        ])
        let previousTimeStamp:UInt64 = 100

        // HEX: 06 06 06 06 06 06 06 06 06 06 06 06
        //      FF 00 00 00 00 00 00 00 00 00 00 FF
        //      01 00 00 00 00 00 00 00 00 00 FF FF
        // index    type                    data:
        // 0..11:   num Int Ts1-12          06 06 06 06 06 06 06 06 06 06 06 06
        // 12:  channel1 Gain Ts1           01 => 1
        // 13:  channel2 Gain Ts1           07 => 7
        // 14:  channel1 Gain Ts2           FF => 7
        // 15:  channel2 Gain Ts2           00 => 0
        // ..
        // 32: channel1 Gain Ts11           01 => 0
        // 33: channel2 Gain Ts11           00 => 0
        // 34: channel1 Gain Ts12           FF => 7
        // 35: channel2 Gain Ts12           00 => 0

        let expectedNumIntTs1:Int32 = 6
        let expectedNumIntTs2:Int32 = 6
        let expectedNumIntTs12:Int32 = 6

        let expectedChannel1GainTs1:Int32 = 7
        let expectedChannel2GainTs1:Int32 = 0
        let expectedChannel1GainTs2:Int32 = 0
        let expectedChannel2GainTs2:Int32 = 0
        let expectedChannel1GainTs11:Int32 = 0
        let expectedChannel2GainTs11:Int32 = 0
        let expectedChannel1GainTs12:Int32 = 7
        let expectedChannel2GainTs12:Int32 = 7

        let ppgDataFrameContent = Data([
            0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
            0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
            0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF]
        )
        let factor:Float = 1.0
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader + ppgDataFrameContent,
            { _,_ in previousTimeStamp },
            { _ in factor },
            { _ in 13 })

        // Act
        let result = try PpgData.parseDataFromDataFrame(frame: dataFrame)

        // Assert
        XCTAssertEqual(3, result.samples.count)
        
        XCTAssertEqual(expectedNumIntTs1, result.samples[0].ppgDataSamples[0])
        XCTAssertEqual(expectedNumIntTs2, result.samples[0].ppgDataSamples[1])
        XCTAssertEqual(expectedNumIntTs12, result.samples[0].ppgDataSamples[2])

        XCTAssertEqual(12, result.samples[1].ppgDataSamples.count)
        XCTAssertEqual(expectedChannel1GainTs1, result.samples[1].ppgDataSamples[0])
        XCTAssertEqual(expectedChannel1GainTs2, result.samples[1].ppgDataSamples[1])
        XCTAssertEqual(expectedChannel1GainTs11, result.samples[1].ppgDataSamples[10])
        XCTAssertEqual(expectedChannel1GainTs12, result.samples[1].ppgDataSamples[11])

        XCTAssertEqual(12, result.samples[2].ppgDataSamples.count)
        XCTAssertEqual(expectedChannel2GainTs1, result.samples[2].ppgDataSamples[0])
        XCTAssertEqual(expectedChannel2GainTs2, result.samples[2].ppgDataSamples[1])
        XCTAssertEqual(expectedChannel2GainTs11, result.samples[2].ppgDataSamples[10])
        XCTAssertEqual(expectedChannel2GainTs12, result.samples[2].ppgDataSamples[11])
        
        XCTAssertEqual(timeStamp, result.timeStamp)
    }
    
    func testCompressedPpgFrameType4Throws() throws {

        // Arrange
        // 10th (0x84) (binary 10000100) results true for check compressed mask (0x80, decimal 128, binary 10000000 )
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x84,
        ])
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader,
            { _,_ in 0 },
            { _ in 1.0 },
            { _ in 13 })

        // Act, Assert
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame), "Compressed FrameType: type_4 is not supported by PPG data parser")
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame)) { error in
            guard case BleGattException.gattDataError = error else {
                return XCTFail()
            }
        }
    }
    
    func testRawPpgFrameType5() throws {
        // Arrange
        // HEX: 01 00 94 35 77 00 00 00 00 05
        // index                                                   data:
        // 0        type                                           01 (PPG)
        // 1..8     timestamp                                      00 94 35 77 00 00 00 00
        let timeStamp:UInt64 = 2000000000
        //9       frame type                                     05 (raw, type 5)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x05
        ])
        let previousTimeStamp:UInt64 = 100

        // HEX: FF FF FF FF
        // index    type                    data:
        // 0..3:    operation mode          FF FF FF FF
        let expectedOperationMode:UInt64 = 4294967295

        let ppgDataFrameContent = Data([0xFF, 0xFF, 0xFF, 0xFF])

        let factor:Float = 1.0
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader + ppgDataFrameContent,
            { _,_ in previousTimeStamp },
            { _ in factor },
            { _ in 13 })

        // Act
        let ppgData = try PpgData.parseDataFromDataFrame(frame: dataFrame)

        // Assert
        XCTAssertEqual(1, ppgData.samples.count)
        XCTAssertEqual(expectedOperationMode, ppgData.samples[0].operationMode)
        XCTAssertEqual(timeStamp, ppgData.samples.last?.timeStamp)
    }
    
    func testCompressedPpgFrameType5Throws() throws {

        // Arrange
        // 10th (0x84) (binary 10000100) results true for check compressed mask (0x80, decimal 128, binary 10000000 )
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x85,
        ])
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader,
            { _,_ in 0 },
            { _ in 1.0 },
            { _ in 13 })

        // Act, Assert
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame), "Compressed FrameType: type_5 is not supported by PPG data parser")
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame)) { error in
            guard case BleGattException.gattDataError = error else {
                return XCTFail()
            }
        }
    }
    
    func testRawPpgFrameType6() throws {
        // Arrange
        // HEX: 01 00 94 35 77 00 00 00 00 06
        // index                                                   data:
        // 0        type                                           01 (PPG)
        // 1..8     timestamp                                      00 94 35 77 00 00 00 00
        let timeStamp:UInt64 = 2000000000
        //9       frame type                                     06 (raw, type 6)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x06,
        ])
        let previousTimeStamp:UInt64 = 100
        let ppgDataFrameContent = Data([
            0x1B, 0x00, 0x00,  //Sport id 27 (trail running)
            0x00, 0x00, 0x00,
            0x00, 0x00
        ])
        let expectedSportId: Int32 = 27
        let factor:Float = 1.0
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader + ppgDataFrameContent,
            { _,_ in previousTimeStamp }  ,
            { _ in factor },
            { _ in 13 })
        
        // Act
        let result = try PpgData.parseDataFromDataFrame(frame: dataFrame)
        
        // Assert
        XCTAssertEqual(1, result.samples.count)
        XCTAssertEqual(1, result.samples[0].ppgDataSamples.count)
        XCTAssertEqual(expectedSportId, result.samples[0].ppgDataSamples[0])
        XCTAssertEqual(timeStamp, result.timeStamp)
    }
    
    func testCompressedPpgFrameType6ThrowsException() throws {

        // 10th (0x86) (binary 10000110) results true for check compressed mask (0x80, decimal 128, binary 10000000)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x86,
        ])
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader,
            { _,_ in 0 },
            { _ in 1.0 },
            { _ in 13 })
        
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame), "Compressed FrameType: type_6 is not supported by PPG data parser")
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame)) { error in
            guard case BleGattException.gattDataError = error else {
                return XCTFail()
            }
        }
    }
    
    func testCompressedPpgFrameType8() throws {
        // Arrange
        // HEX: 01 00 94 35 77 00 00 00 00 88
        // index                                                   data:
        // 0        type                                           01 (PPG)
        // 1..8     timestamp                                      00 94 35 77 00 00 00 00 -> PMD frame hex data is in little-endian format (LSB first).
        // Let's invert order (big-endian) -> 0000000077359400.
        // Let's then calculate hex values to a decimal sum -> (0×16¹⁵)+(0×16¹⁴)+(0×16¹³)+(0×16¹²)+(0×16¹¹)+(0×16¹⁰)+(0×16⁹)+(0×16⁸)+(7×16⁷)+(7×16⁶)+(3×16⁵)+(5×16⁴)+(9×16³)+(4×16²)+(0×16¹)+(0×16⁰)=2000000000
        let timeStamp:UInt64 = 2000000000
        //9       frame type                                     88 (compressed, type 8)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x88
        ])
        let previousTimeStamp:UInt64 = 100
        //HEX:
        // 03 10 01 //0
        // 05 10 02 //1
        // FF FF FF //2
        // 09 10 04 //3
        // 0B 10 05 //4
        // 03 10 06 //5
        // 05 10 07 //6
        // 07 10 08 //7
        // 09 10 09 //8
        // 0B 10 0A //9
        // 03 10 0B //10
        // 05 10 0C //11
        // 07 10 0D //12
        // 09 10 0E //13
        // 0B 10 0F //14
        // 03 10 10 //15
        // 05 10 11 //16
        // 07 10 12 //17
        // 09 10 13 //18
        // 0B 10 14 //19
        // 03 10 15 //20
        // 05 10 16 //21
        // 07 10 17 //22
        // 09 10 18 //23
        // FF FF FF //24
        // 03
        // 01
        // 49 92 24 49 ...

        // index    type                                    data:
        // 0..74:   Reference sample                        03 10 01 ...
        //      Sample 0 (aka. reference sample):
        //      channel 0: 03 10 01 => 0x011003 = 69635
        let sample0Channel0:Int32 = 69635
        //      channel 1: 05 10 02 => 0x021005 = 135173
        let sample0Channel1:Int32 = 135173
        //      channel 2: FF FF FF => 0xFFFFFF = -1
        let sample0Channel2:Int32 = -1
        //      channel 23: 09 10 18 => 0x181009 = 1576969
        let sample0Channel23:Int32 = 1576969
        //      status: FF FF FF => 0xFFFFFF = 16777215
        let sample0ChannelStatus:Int32 = 16777215
        // Delta dump: 03 01 | 49 92 24 49 92 ...
        // 75:      Delta size                           size 1:    0x03 (3 bits)
        // 76:      Sample amount                        size 1:    0x01 (Delta block contains 1 sample)
        let amountOfSamples = 1 + 1 // reference sample + delta samples
        // 77:                                                      0x49( 01 | 001 | 001
        let sample1Channel0 = sample0Channel0 + 1
        let sample1Channel1 = sample0Channel1 + 1

        let ppgDataFrameContent = Data([
            0x03, 0x10, 0x01, 0x05, 0x10, 0x02, 0xFF, 0xFF, 0xFF,
            0x09, 0x10, 0x04, 0x0B, 0x10, 0x05, 0x03, 0x10, 0x06,
            0x05, 0x10, 0x07, 0x07, 0x10, 0x08, 0x09, 0x10, 0x09,
            0x0B, 0x10, 0x0A, 0x03, 0x10, 0x0B, 0x05, 0x10, 0x0C,
            0x07, 0x10, 0x0D, 0x09, 0x10, 0x0E, 0x0B, 0x10, 0x0F,
            0x03, 0x10, 0x10, 0x05, 0x10, 0x11, 0x07, 0x10, 0x12,
            0x09, 0x10, 0x13, 0x0B, 0x10, 0x14, 0x03, 0x10, 0x15,
            0x05, 0x10, 0x16, 0x07, 0x10, 0x17, 0x09, 0x10, 0x18,
            0xFF, 0xFF, 0xFF, 0x03, 0x01, 0x49, 0x92, 0x24, 0x49,
            0x92, 0x24, 0x49, 0x92, 0x24, 0x00
        ])
        let factor:Float = 1.0
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader + ppgDataFrameContent,
            { _,_ in previousTimeStamp },
            { _ in factor },
            { _ in 13 })

        // Act
        let ppgData = try PpgData.parseDataFromDataFrame(frame: dataFrame)

        // Assert
        XCTAssertEqual(amountOfSamples, ppgData.samples.count)
        XCTAssertEqual(24, ppgData.samples[0].ppgDataSamples.count)
        XCTAssertEqual(sample0Channel0, ppgData.samples[0].ppgDataSamples[0])
        XCTAssertEqual(sample0Channel1, ppgData.samples[0].ppgDataSamples[1])
        XCTAssertEqual(sample0Channel2, ppgData.samples[0].ppgDataSamples[2])
        XCTAssertEqual(sample0Channel23, ppgData.samples[0].ppgDataSamples[23])
        XCTAssertEqual(sample0ChannelStatus, ppgData.samples[0].status)
        XCTAssertEqual(sample1Channel0, ppgData.samples[1].ppgDataSamples[0])
        XCTAssertEqual(sample1Channel1, ppgData.samples[1].ppgDataSamples[1])
        
        XCTAssertEqual(timeStamp, ppgData.timeStamp)
        XCTAssertEqual(timeStamp, ppgData.samples.last?.timeStamp)
    }
    
    func testUncompressedPpgFrameType8ThrowsException() throws {

        // Arrange
        // 10th (0x08) (binary 00001000) results true for check compressed mask (0x80, decimal 128, binary 10000000)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x08,
        ])
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader,
            { _,_ in 0 },
            { _ in 1.0 },
            { _ in 13 })
        
        // Act, Assert
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame), "Compressed FrameType: type_8 is not supported by PPG data parser")
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame)) { error in
            guard case BleGattException.gattDataError = error else {
                return XCTFail()
            }
        }
    }
    
    func testRawPpgFrameType9() throws {
        // Arrange
        // HEX: 01 00 94 35 77 00 00 00 00 09
        // index                                                   data:
        // 0        type                                           01 (PPG)
        // 1..8     timestamp                                      00 94 35 77 00 00 00 00
        let timeStamp:UInt64 = 2000000000
        //9       frame type                                     09 (raw, type 9)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x09,
        ])
        let previousTimeStamp:UInt64 = 100

        // HEX: 06 06 06 06 06 06 06 06 06 06 06 06
        //      FF 00 00 00 00 00 00 00 00 00 00 FF
        //      01 00 00 00 00 00 00 00 00 00 FF FF
        // index    type                    data:
        // 0..11:   num Int Ts1-12          06 06 06 06 06 06 06 06 06 06 06 06
        // 12:  channel1 Gain Ts1           01 => 1
        // 13:  channel2 Gain Ts1           07 => 7
        // 14:  channel1 Gain Ts2           FF => 7
        // 15:  channel2 Gain Ts2           00 => 0
        // ..
        // 32: channel1 Gain Ts11           01 => 0
        // 33: channel2 Gain Ts11           00 => 0
        // 34: channel1 Gain Ts12           FF => 7
        // 35: channel2 Gain Ts12           00 => 0

        let expectedNumIntTs1:Int32 = 6
        let expectedNumIntTs2:Int32 = 6
        let expectedNumIntTs12:Int32 = 6

        let expectedChannel1GainTs1:Int32 = 7
        let expectedChannel2GainTs1:Int32 = 0
        let expectedChannel1GainTs2:Int32 = 0
        let expectedChannel2GainTs2:Int32 = 0
        let expectedChannel1GainTs11:Int32 = 0
        let expectedChannel2GainTs11:Int32 = 0
        let expectedChannel1GainTs12:Int32 = 7
        let expectedChannel2GainTs12:Int32 = 7

        let ppgDataFrameContent = Data([
            0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
            0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
            0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF]
        )
        let factor:Float = 1.0
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader + ppgDataFrameContent,
            { _,_ in previousTimeStamp },
            { _ in factor },
            { _ in 13 })

        // Act
        let result = try PpgData.parseDataFromDataFrame(frame: dataFrame)

        // Assert
        XCTAssertEqual(3, result.samples.count)
        
        XCTAssertEqual(expectedNumIntTs1, result.samples[0].ppgDataSamples[0])
        XCTAssertEqual(expectedNumIntTs2, result.samples[0].ppgDataSamples[1])
        XCTAssertEqual(expectedNumIntTs12, result.samples[0].ppgDataSamples[2])

        XCTAssertEqual(12, result.samples[1].ppgDataSamples.count)
        XCTAssertEqual(expectedChannel1GainTs1, result.samples[1].ppgDataSamples[0])
        XCTAssertEqual(expectedChannel1GainTs2, result.samples[1].ppgDataSamples[1])
        XCTAssertEqual(expectedChannel1GainTs11, result.samples[1].ppgDataSamples[10])
        XCTAssertEqual(expectedChannel1GainTs12, result.samples[1].ppgDataSamples[11])

        XCTAssertEqual(12, result.samples[2].ppgDataSamples.count)
        XCTAssertEqual(expectedChannel2GainTs1, result.samples[2].ppgDataSamples[0])
        XCTAssertEqual(expectedChannel2GainTs2, result.samples[2].ppgDataSamples[1])
        XCTAssertEqual(expectedChannel2GainTs11, result.samples[2].ppgDataSamples[10])
        XCTAssertEqual(expectedChannel2GainTs12, result.samples[2].ppgDataSamples[11])
        
        XCTAssertEqual(timeStamp, result.timeStamp)
    }
    
    func testCompressedPpgFrameType9Throws() throws {

        // Arrange
        // 10th (0x89) (binary 10001001) results true for check compressed mask (0x80, decimal 128, binary 10000000 )
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x89,
        ])
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader,
            { _,_ in 0 },
            { _ in 1.0 },
            { _ in 13 })

        // Act, Assert
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame), "Compressed FrameType: type_9 is not supported by PPG data parser")
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame)) { error in
            guard case BleGattException.gattDataError = error else {
                return XCTFail()
            }
        }
    }
    
    func testCompressedPpgFrameType0() throws {
        // Arrange
        // HEX: 01 00 94 35 77 00 00 00 00 80
        // index                                                   data:
        // 0        type                                           01 (PPG)
        // 1..8     timestamp                                      00 94 35 77 00 00 00 00
        let timeStamp:UInt64 = 2000000000
        //9       frame type                                     80 (compressed, type 0)
        let ppgDataFrameHeader = Data([
            0x01,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x80,
        ])
        let previousTimeStamp:UInt64 = 100
        
        // HEX: 2C 2D 00 C2 77 00 D3 D2 FF 3D 88 FF 0A 29 B2 F0 EE 34 11 B2 EC EE 74 11 B1 E8 FE B4 11 B1 E8 FE B4 11 B1 E0 FE 34 12 B0 DC 0E 75 12 B0 D8 0E B5 12 AF D4 1E F5 12 AF D0 1E 35 13 AE CC 2E 75 13 AE C8 2E B5 13 AD C4 3E F5 13 AD BC 3E 75 14 AD BC 3E 75 14 AC B8 4E B5 14 AC B4 4E F5 14 AB B0 5E 35 15 AA AC 6E 75 15 AA A8 6E B5 15 AA A4 6E F5 15 A9 A0 7E 35 16 A9 9C 7E 75 16 A8 98 8E B5 16 A7 94 9E F5 16 A7 90 9E 35 17 A7 8C 9E 75 17 A6 88 AE B5 17 A5 88 BE B5 17 A5 80 BE 35 18 A4 7C CE 75 18 A4 78 CE B5 18 A3 78 DE B5 18 A2 70 EE 35 19 A2 6C EE 75 19 A2 6C EE 75 19 A1 68 FE B5 19 A0 60 0E 36 1A 9F 60 1E 36 1A 9F 5C 1E 76 1A 9F 58 1E B6 1A 9D 54 3E F6 1A
        // index    type                                    data:
        // 0..11:    Reference sample                       0x2C 0x2D 0x00 0xC2 0x77 0x00 0xD3 0xD2 0xFF 0x3D 0x88 0xFF
        //      Sample 0 (aka. reference sample):
        //      channel 0: 2C 2D 00 => 0x002D2C => 11564
        let refSample0Channel0:Int32 = 11564
        //      channel 1: C2 77 00 => 0x0077C2 => 30658
        let refSample0Channel1:Int32 = 30658
        //      channel 2: D3 D2 FF => 0xFFD2D3 => -11565
        let refSample0Channel2:Int32 = -11565
        //      channel 3: 3D 88 FF => 0xFF883D => -30659
        let refSample0Channel3:Int32 = -30659
        // Delta dump: 0A 29 | B2 F0 EE 34 11 B2 EC EE 74 11 B1 E8 FE B4 11 B1 ...
        // 12:      Delta size                           size 1:    0x0A (10 bits)
        // 13:      Sample amount                        size 1:    0x29 (Delta block contains 41 samples)
        // 14:                                                      0xB2 (binary: 1011 0010)
        // 15:                                                      0xF0 (binary: 1111 00 | 00)
        // 16:                                                     0xEE (binary: 1110 | 1110)
        //      Sample 1 - channel 0, size 10 bits: 00 1011 0010
        //      Sample 1 - channel 1, size 10 bits: 11 1011 1100
        // 17:                                                     0x34 (binary: 00 | 11 0100)
        //      Sample 1 - channel 2, size 10 bits: 11 0100 1110
        // 18:
        //      Sample 1 - channel 3, size 10 bits: 00 0100 0100   0x11 (binary: 0001 0001)
        let refSample1Channel0:Int32 = 178
        let refSample1Channel1:Int32 = -68
        let refSample1Channel2:Int32 = -178
        let refSample1Channel3:Int32 = 68
        let amountOfSamples = 1 + 41 // reference sample + delta samples
        let ppgDataFrameContent = Data([
            0x2C, 0x2D, 0x00, 0xC2, 0x77, 0x00, 0xD3, 0xD2, 0xFF,
            0x3D, 0x88, 0xFF, 0x0A, 0x29, 0xB2, 0xF0, 0xEE, 0x34,
            0x11, 0xB2, 0xEC, 0xEE, 0x74, 0x11, 0xB1, 0xE8, 0xFE,
            0xB4, 0x11, 0xB1, 0xE8, 0xFE, 0xB4, 0x11, 0xB1, 0xE0,
            0xFE, 0x34, 0x12, 0xB0, 0xDC, 0x0E, 0x75, 0x12, 0xB0,
            0xD8, 0x0E, 0xB5, 0x12, 0xAF, 0xD4, 0x1E, 0xF5, 0x12,
            0xAF, 0xD0, 0x1E, 0x35, 0x13, 0xAE, 0xCC, 0x2E, 0x75,
            0x13, 0xAE, 0xC8, 0x2E, 0xB5, 0x13, 0xAD, 0xC4, 0x3E,
            0xF5, 0x13, 0xAD, 0xBC, 0x3E, 0x75, 0x14, 0xAD, 0xBC,
            0x3E, 0x75, 0x14, 0xAC, 0xB8, 0x4E, 0xB5, 0x14, 0xAC,
            0xB4, 0x4E, 0xF5, 0x14, 0xAB, 0xB0, 0x5E, 0x35, 0x15,
            0xAA, 0xAC, 0x6E, 0x75, 0x15, 0xAA, 0xA8, 0x6E, 0xB5,
            0x15, 0xAA, 0xA4, 0x6E, 0xF5, 0x15, 0xA9, 0xA0, 0x7E,
            0x35, 0x16, 0xA9, 0x9C, 0x7E, 0x75, 0x16, 0xA8, 0x98,
            0x8E, 0xB5, 0x16, 0xA7, 0x94, 0x9E, 0xF5, 0x16, 0xA7,
            0x90, 0x9E, 0x35, 0x17, 0xA7, 0x8C, 0x9E, 0x75, 0x17,
            0xA6, 0x88, 0xAE, 0xB5, 0x17, 0xA5, 0x88, 0xBE, 0xB5,
            0x17, 0xA5, 0x80, 0xBE, 0x35, 0x18, 0xA4, 0x7C, 0xCE,
            0x75, 0x18, 0xA4, 0x78, 0xCE, 0xB5, 0x18, 0xA3, 0x78,
            0xDE, 0xB5, 0x18, 0xA2, 0x70, 0xEE, 0x35, 0x19, 0xA2,
            0x6C, 0xEE, 0x75, 0x19, 0xA2, 0x6C, 0xEE, 0x75, 0x19,
            0xA1, 0x68, 0xFE, 0xB5, 0x19, 0xA0, 0x60, 0x0E, 0x36,
            0x1A, 0x9F, 0x60, 0x1E, 0x36, 0x1A, 0x9F, 0x5C, 0x1E,
            0x76, 0x1A, 0x9F, 0x58, 0x1E, 0xB6, 0x1A, 0x9D, 0x54,
            0x3E, 0xF6, 0x1A
        ])
        
        let factor:Float = 1.0
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader + ppgDataFrameContent,
            { _,_ in previousTimeStamp }  ,
            { _ in factor },
            { _ in 22 })
        
        // Act
        let result = try PpgData.parseDataFromDataFrame(frame: dataFrame)
        
        // Assert
        XCTAssertEqual(amountOfSamples, result.samples.count)
        XCTAssertEqual(3, result.samples[0] .ppgDataSamples.count)
        XCTAssertEqual(refSample0Channel0, result.samples[0] .ppgDataSamples[0])
        XCTAssertEqual(refSample0Channel1, result.samples[0].ppgDataSamples[1])
        XCTAssertEqual(refSample0Channel2, result.samples[0].ppgDataSamples[2])
        XCTAssertEqual(refSample0Channel3, result.samples[0].ambientSample)
        
        XCTAssertEqual(3, result.samples[1].ppgDataSamples.count)
        XCTAssertEqual(refSample0Channel0 + refSample1Channel0, result.samples[1].ppgDataSamples[0])
        XCTAssertEqual(refSample0Channel1 + refSample1Channel1, result.samples[1].ppgDataSamples[1])
        XCTAssertEqual(refSample0Channel2 + refSample1Channel2, result.samples[1].ppgDataSamples[2])
        XCTAssertEqual(refSample0Channel3 + refSample1Channel3, result.samples[1].ambientSample)
        
        XCTAssertEqual(timeStamp, result.timeStamp)
        XCTAssertEqual(timeStamp, result.samples.last?.timeStamp)
    
    }
    
    func testCompressedPpgFrameType10() throws {

        // Arrange
        let expectedGreenSamples:[Int32] =
        [1575733, 1957739, 1740229, 1761644, 1807181, 1489480, 1577122, 1822779]
        let expectedRedSamples:[Int32] = [1973554, 1752419, 1569544, 1126395, 256, 1312672]
        let expectedIrSamples:[Int32] = [1671106, 2230896, 1670551, 2230476, 1312672, -5901481]
        let expectedStatus: Int32 = 249855
        let expectedTimeStamp: UInt64 = 112524943566142944
        
        // Frame data with timestamps, frame type data etc.
        let ppgDataFrameContent = Data([
            0x01, 0xC0, 0x6E, 0x6A, 0x43, 0xE1,
            0x61, 0xEE, 0x0A, 0x8A, 0x35, 0x0B,
            0x18, 0x6B, 0xDF, 0x1D, 0xC5, 0x8D,
            0x1A, 0x6C, 0xE1, 0x1A, 0x4D, 0x93,
            0x1B, 0x48, 0xBA, 0x16, 0xA2, 0x10,
            0x18, 0x3B, 0xD0, 0x1B, 0x32, 0x1D,
            0x1E, 0x63, 0xBD, 0x1A, 0x08, 0xF3,
            0x17, 0xFB, 0x2F, 0x11, 0x00, 0x01,
            0x00, 0xA0, 0x07, 0x14, 0xC2, 0x7F,
            0x19, 0x70, 0x0A, 0x22, 0x97, 0x7D,
            0x19, 0xCC, 0x08, 0x22, 0xA0, 0x07,
            0x14, 0x57, 0xF3, 0xA5, 0xFF, 0xCF,
            0x03, 0x18, 0x06, 0x52, 0xB3, 0xFF,
            0x8E, 0xF9, 0xFF, 0xAE, 0xEF, 0xFF,
            0x5F, 0xFB, 0xFF, 0xB1, 0xA6, 0xFF,
            0x75, 0xF8, 0xFF, 0xA7, 0xF0, 0xFF,
            0x32, 0xF1, 0xFF, 0xB8, 0x00, 0x00,
            0x1E, 0x00, 0x00, 0x97, 0x02, 0x00,
            0x08, 0xFE, 0xFF, 0x00, 0xFF, 0xFF,
            0x60, 0xF8, 0xEB, 0x8E, 0x07, 0x00,
            0x8A, 0x00, 0x00, 0xAE, 0x08, 0x00,
            0x97, 0x00, 0x00, 0x60, 0xF8, 0xEB,
            0x32, 0x8A, 0xFD, 0x00, 0x00, 0x00,
            0x4B, 0x2A, 0xFF, 0xA7, 0x04, 0x00,
            0xBC, 0x0F, 0x00, 0xD0, 0xFE, 0xFF,
            0x64, 0xF5, 0xFE, 0x94, 0xE8, 0xFF,
            0x5E, 0x07, 0x00, 0x2F, 0x17, 0x00,
            0x34, 0x27, 0x00, 0xE7, 0x11, 0x00,
            0x7B, 0x08, 0x00, 0x2C, 0x03, 0x00,
            0x00, 0x01, 0x00, 0xA0, 0x07, 0x14,
            0x09, 0x3C, 0x00, 0xD0, 0x86, 0x00,
            0xCE, 0x3B, 0x00, 0xCA, 0x86, 0x00,
            0xA0, 0x07, 0x14, 0xCE, 0x75, 0x02,
            0x00, 0x00, 0x00, 0xF0, 0xA4, 0xFF,
            0xAA, 0x08, 0x00, 0x45, 0x19, 0x00,
            0x8B, 0xFF, 0xFF, 0x9A, 0x8B, 0xFF,
            0x65, 0xF4, 0xFF, 0x92, 0x11, 0x00,
            0x40, 0x20, 0x00, 0xC5, 0x23, 0x00,
            0x8E, 0x0F, 0x00, 0x01, 0x06, 0x00,
            0x6F, 0x05, 0x00, 0xD4, 0x02, 0x19,
            0xB8, 0x2D, 0x38, 0xBF, 0x2D, 0x00,
            0x2C, 0x78, 0x00, 0x23, 0x2E, 0x00,
            0xA3, 0x77, 0x00, 0x6C, 0xCA, 0xB5,
            0x32, 0x8A, 0xFD, 0x00, 0x00, 0x00,
            0xDE, 0xF1, 0xFF, 0x24, 0x06, 0x00,
            0x2B, 0x12, 0x00, 0x78, 0xFE, 0xFF,
            0x89, 0xE9, 0xFF, 0x08, 0xFD, 0xFF,
            0x31, 0x0B, 0x00, 0x49, 0x0F, 0x00,
            0xE2, 0x06, 0x00, 0x3C, 0x04, 0x00,
            0x50, 0x02, 0x00, 0x53, 0x01, 0x00,
            0x2C, 0xFD, 0xE6, 0x48, 0xD2, 0xC7,
            0x2E, 0x0C, 0x00, 0x11, 0x1C, 0x00,
            0x0F, 0x0D, 0x00, 0x2E, 0x1C, 0x00,
            0x94, 0x35, 0x4A, 0xCE, 0x75, 0x02,
            0x00, 0x00, 0x00, 0x9C, 0x06, 0x00,
            0x33, 0x04, 0x00, 0x5F, 0x06, 0x00,
            0xE1, 0xFB, 0xFF, 0x15, 0x06, 0x00,
            0xB9, 0x00, 0x00, 0x1C, 0x06, 0x00,
            0xCE, 0x01, 0x00, 0x6F, 0xFC, 0xFF,
            0xCD, 0xFF, 0xFF, 0xD1, 0x01, 0x00,
            0x6A, 0xFF, 0xFF, 0xD4, 0x02, 0x19,
            0xB8, 0x2D, 0x38, 0x68, 0xFE, 0xFF,
            0xB5, 0xF6, 0xFF, 0xD8, 0xFD, 0xFF,
            0xA6, 0xF6, 0xFF, 0x6C, 0xCA, 0xB5,
            0x32, 0x8A, 0xFD, 0x00, 0x00, 0x00,
            0x6E, 0xDC, 0xFF, 0xC7, 0x00, 0x00,
            0x0F, 0x06, 0x00, 0xC5, 0xF8, 0xFF,
            0x9F, 0xDE, 0xFF, 0xE7, 0xFB, 0xFF,
            0x0E, 0xFE, 0xFF, 0x61, 0xF9, 0xFF,
            0x9D, 0x04, 0x00, 0xB8, 0x00, 0x00,
            0x7E, 0x02, 0x00, 0x67, 0x01, 0x00,
            0x2C, 0xFD, 0xE6, 0x48, 0xD2, 0xC7,
            0x7E, 0x07, 0x00, 0xF5, 0x0E, 0x00,
            0x14, 0x07, 0x00, 0xF1, 0x0E, 0x00,
            0x94, 0x35, 0x4A, 0xCE, 0x75, 0x02,
            0x00, 0x00, 0x00])
        
        let previousTimeStamp:UInt64 = 100
        
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameContent,
            { _,_ in previousTimeStamp },
            { _ in 1.0 },
            { _ in 13 })
        
        // Act
        let result = try PpgData.parseDataFromDataFrame(frame: dataFrame)
        
        // Assert
        XCTAssertNotNil(result)
        XCTAssertEqual(expectedStatus, result.samples.first?.status)
        XCTAssertEqual(7, result.samples.count)
        XCTAssertEqual(expectedTimeStamp, result.samples[0].timeStamp)

        var index = 0;
        for sample in result.samples[0].ppgDataSamples[0..<8] {
           let expected = expectedGreenSamples[index]
           XCTAssertEqual(expected, sample)
           index+=1
        }
        index = 0
        for sample in result.samples[0].ppgDataSamples[8..<14] {
           let expected = expectedRedSamples[index]
           XCTAssertEqual(expected, sample)
           index+=1
        }
        index = 0
        for sample in result.samples[0].ppgDataSamples[14..<20] {
           let expected = expectedIrSamples[index]
           XCTAssertEqual(expected, sample)
           index+=1
        }
   }

   func testUnCompressedPpgFrameType10ThrowsException() throws {

       // Arrange
       // 10th (0x0A) (decimal 10) results false for check compressed mask (0x80, decimal 128 )
       let ppgDataFrameContent = Data([
           0x01, 0xC0, 0x6E, 0x6A, 0x43, 0xE1,
           0x61, 0xEE, 0x0A, 0x0A, 0x35, 0x0B,
           0x18, 0x6B, 0xDF, 0x1D, 0xC5, 0x8D,
           0x1A, 0x6C, 0xE1, 0x1A, 0x4D, 0x93]
       )
       let dataFrame = try PmdDataFrame(
           data: ppgDataFrameContent,
           { _,_ in 0 },
           { _ in 1.0 },
           { _ in 13 })

       // Act, Assert
       XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame), "Raw FrameType: TYPE_10 is not supported by PPG data parser")
       XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame)) { error in
           guard case BleGattException.gattDataError = error else {
               return XCTFail()
           }
       }
   }
    
    func testCompressedPpgFrameType13() throws {

        // Arrange
        let expectedPPGChannel0: Int32 = 2759080
        let expectedPPGChannel1: Int32 = 2537320
        let expectedStatus: Int32 = 3
        let expectedTimeStamp: UInt64 = 23809623
        let amountOfSamples: UInt = 84
        let previousTimeStamp:UInt64 = 100
        
        // Frame data with timestamps, frame type data etc.
        let ppgDataFrameContent = Data([
                        0x01, 0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00, 0x8D, // Header
                        0xA8, 0x19, 0x2A, 0x68, 0xB7, 0x26, 0x03, 0x00, 0x00, 0x0C, 0x03, 0x66,0x94, 0xF8, 0x00, 0x80, 0x76, 0xF4,
                        0x0F, 0x00, 0x64, 0xE4, 0x23, 0x00, 0x00, 0x10, 0x0C, 0x55, 0x0C, 0x42,0xFE, 0x00, 0x00, 0x7A, 0x06, 0x4E,
                        0x01, 0x00, 0x00, 0x63, 0xFF, 0x01, 0xFD, 0x00, 0x00, 0x12, 0x03, 0xDD, 0xFF, 0x00, 0x00, 0x45, 0xF9, 0x76,
                        0xFF, 0x00, 0x00, 0x33, 0xF1, 0x34, 0xFF, 0x00, 0x00, 0x4C, 0xED, 0x70, 0xFD, 0x00, 0x00, 0xAE, 0xF0, 0x86,
                        0x01, 0x00, 0x00, 0xA0, 0xF5, 0x09, 0x01, 0x00, 0x00, 0x16, 0xF5, 0xF9, 0xFB, 0x00, 0x00, 0x8B, 0xF9, 0x50,
                        0x00, 0x00, 0x00, 0x12, 0xFC, 0x05, 0x01, 0x00, 0x00, 0x0C, 0x10, 0xFB, 0x59, 0xEB, 0x00, 0x20, 0x92, 0x27,
                        0x0D, 0x00, 0xE7, 0xCE, 0xE0, 0x00, 0xC0, 0xEE, 0xFC, 0x0C, 0x00, 0xE9, 0xBD, 0xDB, 0x00, 0xC0, 0xF9, 0xA4,
                        0x0D, 0x00, 0x1A, 0xB1, 0xAE, 0x00, 0x60, 0xFD, 0x43, 0x0F, 0x00, 0xAB, 0xA1, 0xF7, 0x00, 0xE0, 0x37, 0x2D,
                        0x0E, 0x00, 0xBD, 0xB3, 0xDE, 0x00, 0x60, 0x4D, 0x94, 0x0F, 0x00, 0xD6, 0xD1, 0x07, 0x00, 0x30, 0x33, 0xDB,
                        0x0F, 0x00, 0x97, 0xF4, 0x14, 0x00, 0x00, 0x36, 0x2C, 0x0E, 0x00, 0x10, 0x28, 0xCD, 0x08, 0x91, 0xFF, 0x00,
                        0x00, 0xC1, 0x06, 0xF1, 0x00, 0x00, 0x00, 0x42, 0x01, 0xE9, 0xFD, 0x00, 0x00, 0x3F, 0x11, 0x8D, 0xF9, 0x00,
                        0x00, 0x1E, 0x34, 0xAC, 0x03, 0x00, 0x00, 0xAD, 0x31, 0xAE, 0x04, 0x00, 0x00, 0x7C, 0x13, 0x93, 0xFC, 0x00,
                        0x00, 0xAA, 0xFA, 0xAD, 0xF6, 0x00, 0x00, 0xBD, 0xF8, 0x0D, 0xF4, 0x00, 0x00, 0xAC, 0xF6, 0x85, 0xFB, 0x00,
                        0x00, 0x28, 0xF8, 0x4B, 0xF9, 0x00, 0x00, 0x7A, 0x01, 0xDD, 0xFC, 0x00, 0x00, 0x93, 0x0F, 0x81, 0x05, 0x00,
                        0x00, 0xFF, 0x20, 0x57, 0x0F, 0x00, 0x00, 0x0A, 0x27, 0x22, 0x13, 0x00, 0x00, 0xFA, 0x10, 0xA5, 0x09, 0x00,
                        0x00, 0x3C, 0x09, 0x6A, 0x00, 0x00, 0x00, 0x51, 0x27, 0x04, 0x02, 0x00, 0x00, 0x55, 0x23, 0x77, 0xFE, 0x00,
                        0x00, 0x56, 0xFB, 0x42, 0xF6, 0x00, 0x00, 0x01, 0xE1, 0x1F, 0xF2, 0x00, 0x00, 0xE6, 0xD9, 0x2F, 0xEB, 0x00,
                        0x00, 0xE9, 0xDC, 0x6A, 0xE8, 0x00, 0x00, 0x58, 0xE4, 0xED, 0xE3, 0x00, 0x00, 0xF1, 0xEF, 0x33, 0xE8, 0x00,
                        0x00, 0x9B, 0xF4, 0x64, 0xEB, 0x00, 0x00, 0xBC, 0xF5, 0xD9, 0xED, 0x00, 0x00, 0xE9, 0xF8, 0xDE, 0xF1, 0x00,
                        0x00, 0x54, 0xEC, 0xAF, 0xF3, 0x00, 0x00, 0x9D, 0xE7, 0x86, 0xFB, 0x00, 0x00, 0x00, 0xEE, 0xFE, 0xFF, 0x00,
                        0x00, 0x33, 0xEE, 0x1D, 0x00, 0x00, 0x00, 0x1B, 0xEF, 0x07, 0x02, 0x00, 0x00, 0xD4, 0xF2, 0x5B, 0x06, 0x00,
                        0x00, 0xD7, 0xF5, 0x9C, 0x00, 0x00, 0x00, 0xD0, 0xFB, 0xA7, 0x01, 0x00, 0x00, 0xA8, 0xFA, 0x35, 0x01, 0x00,
                        0x00, 0xB7, 0xFA, 0x86, 0x02, 0x00, 0x00, 0x84, 0xF7, 0x65, 0x06, 0x00, 0x00, 0xBA, 0xFD, 0x17, 0x02, 0x00,
                        0x00, 0x0C, 0x0C, 0x20, 0xDF, 0xDF, 0x00, 0x20, 0xF6, 0x32, 0x01, 0x00, 0xAA, 0x5E, 0x02, 0x00, 0xD0, 0xDF,
                        0x01, 0x01, 0x00, 0xEA, 0xA2, 0x21, 0x00, 0x90, 0x1C, 0xBA, 0x03, 0x00, 0x0A, 0x73, 0x2D, 0x00, 0x90, 0x11,
                        0x65, 0x02, 0x00, 0xC4, 0x62, 0xDE, 0x00, 0x00, 0x08, 0xD2, 0x03, 0x00, 0xC0, 0x16, 0x2A, 0x00, 0xD0, 0x4D,
                        0xC3, 0x01, 0x00])
        
        
        
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameContent,
            { _,_ in previousTimeStamp },
            { _ in 1.0 },
            { _ in 13 })
        
        // Act
        let result = try PpgData.parseDataFromDataFrame(frame: dataFrame)
        
        // Assert
        XCTAssertNotNil(result)
        XCTAssertEqual(expectedStatus, result.samples.first?.status)
        XCTAssertEqual(84, result.samples.count)
        XCTAssertEqual(expectedTimeStamp, result.samples[0].timeStamp)
        XCTAssertEqual(expectedPPGChannel0, result.samples[0].ppgDataSamples[0])
        XCTAssertEqual(expectedPPGChannel1, result.samples[0].ppgDataSamples[1])
        XCTAssertEqual(expectedStatus, result.samples[0].status)
   }

   func testUnCompressedPpgFrameType13ThrowsException() throws {

       // Arrange
       // 10th (0x0A) (decimal 10) results false for check compressed mask (0x80, decimal 128 )
       
       let ppgDataFrameContent = Data([
           0x01, 0xC0, 0x6E, 0x6A, 0x43, 0xE1,
           0x61, 0xEE, 0x0A, 0x0D, 0x35, 0x0B,
           0x18, 0x6B, 0xDF, 0x1D, 0xC5, 0x8D,
           0x1A, 0x6C, 0xE1, 0x1A, 0x4D, 0x93]
       )
       let dataFrame = try PmdDataFrame(
           data: ppgDataFrameContent,
           { _,_ in 0 },
           { _ in 1.0 },
           { _ in 13 })

       // Act, Assert
       XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame), "Raw FrameType: TYPE_13 is not supported by PPG data parser")
       XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame)) { error in
           guard case BleGattException.gattDataError = error else {
               return XCTFail()
           }
       }
   }
    
    func testRawPpgFrameType14() throws {
        // Arrange
        // HEX: 01 00 94 35 77 00 00 00 00 0E
        // index                                                   data:
        // 0        type                                           01 (PPG)
        // 1..9     timestamp                                      00 94 35 77 00 00 00 00
        let timeStamp:UInt64 = 2000000000
        // frame type 0E (14 decimal)
        let ppgDataFrameHeader = Data([
            0xA5,
            0x00, 0x94, 0x35, 0x77, 0x00, 0x00, 0x00, 0x00,
            0x0E
        ])

        let previousTimeStamp:UInt64 = 100

        let expectedNumIntTs1:Int32 = 3

        let expectedChannel1GainTs1:Int32 = 0
        let expectedChannel2GainTs1:Int32 = 2
        

        let ppgDataFrameContent = Data([0x03, 0x48, 0x92])
        
        let factor:Float = 1.0
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader + ppgDataFrameContent,
            { _,_ in previousTimeStamp },
            { _ in factor },
            { _ in 13 })

        // Act
        let result = try PpgData.parseDataFromDataFrame(frame: dataFrame)

        // Assert
        XCTAssertEqual(1, result.samples.count)
        XCTAssertEqual(3, result.samples[0].ppgDataSamples.count)
        XCTAssertEqual(expectedNumIntTs1, result.samples[0].ppgDataSamples[0])
        XCTAssertEqual(expectedChannel1GainTs1, result.samples[0].ppgDataSamples[1])
        XCTAssertEqual(expectedChannel2GainTs1, result.samples[0].ppgDataSamples[2])
        
        XCTAssertEqual(timeStamp, result.timeStamp)
    }
    
    func testCompressedPpgFrameType14Throws() throws {

        // Arrange
        // 10th value (0x8E) (decimal 142) results false for check compressed mask (0x80, decimal 128 )
        let ppgDataFrameHeader = Data([
            0xA5,
            0x00, 0x00, 0x6B, 0xC5, 0x03, 0x99, 0x00, 0x00, 0x8E, 0x03, 0x48,
            0x92
        ])
        let dataFrame = try PmdDataFrame(
            data: ppgDataFrameHeader,
            { _,_ in 100 },
            { _ in 1.0 },
            { _ in 13 })

        // Act, Assert
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame), "Compressed FrameType: type_14 is not supported by PPG data parser")
        XCTAssertThrowsError(try PpgData.parseDataFromDataFrame(frame: dataFrame)) { error in
            guard case BleGattException.gattDataError = error else {
                return XCTFail()
            }
        }
    }
}
