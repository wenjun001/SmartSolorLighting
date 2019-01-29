//
//  TrailerDetailViewController.swift
//  SmartSolorLighting
//
//  Created by xiu on 1/28/19.
//  Copyright © 2019 wma. All rights reserved.
//

import UIKit
import Charts
import SnapKit
import Material
import BetterSegmentedControl

class TrailerDetailViewController: UIViewController,ChartViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawLineChart()
        view.backgroundColor = Color.white
        self.view.addSubview(lineChartView)
        lineChartView.snp.makeConstraints { (make) in
            make.width.equalTo(view)
            make.height.equalTo(300)
            make.centerY.equalTo(view).offset(-200)
            make.centerX.equalTo(view)
        }
        drawPieChartView()
        self.view.addSubview(pieChartView)
        pieChartView.snp.makeConstraints { (make) in
            make.width.equalTo(view)
            make.height.equalTo(300)
            make.centerY.equalTo(view).offset(100);
            make.centerX.equalTo(view)
        }
        
        
        
        
        let navigationSegmentedControl = BetterSegmentedControl(
            frame: CGRect(x: 35.0, y: 40.0, width: 200.0, height: 30.0),
            segments: LabelSegment.segments(withTitles: ["Lights 1 On", "Lights 1 Off"],
                                            normalFont: UIFont(name: "Avenir", size: 13.0)!,
                                            normalTextColor: .lightGray,
                                            selectedFont: UIFont(name: "Avenir", size: 13.0)!,
                                            selectedTextColor: .white),
            options:[.backgroundColor(.darkGray),
                     .indicatorViewBackgroundColor(UIColor(red:0.55, green:0.26, blue:0.86, alpha:1.00)),
                     .cornerRadius(3.0),
                     .bouncesOnChange(false)])
        navigationSegmentedControl.addTarget(self, action: #selector(navigationSegmentedControlValueChanged(_:)), for: .valueChanged)
        
        
        self.view.addSubview(navigationSegmentedControl)
        navigationSegmentedControl.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerY.equalTo(view).offset(300);
            make.centerX.equalTo(view)
        }
        
        let navigationSegmentedControl2 = BetterSegmentedControl(
            frame: CGRect(x: 35.0, y: 40.0, width: 200.0, height: 30.0),
            segments: LabelSegment.segments(withTitles: ["Lights 2 On", "Lights 2 Off"],
                                            normalFont: UIFont(name: "Avenir", size: 13.0)!,
                                            normalTextColor: .lightGray,
                                            selectedFont: UIFont(name: "Avenir", size: 13.0)!,
                                            selectedTextColor: .white),
            options:[.backgroundColor(.darkGray),
                     .indicatorViewBackgroundColor(UIColor(red:0.55, green:0.26, blue:0.86, alpha:1.00)),
                     .cornerRadius(3.0),
                     .bouncesOnChange(false)])
        self.view.addSubview(navigationSegmentedControl2)
        navigationSegmentedControl2.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerY.equalTo(view).offset(340);
            make.centerX.equalTo(view)
        }
        
        
        
    }
    
    @objc
    func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        if sender.index == 0 {
            print("Turning lights on.")
            //view.backgroundColor = .white
        }
        else {
            print("Turning lights off.")
            //view.backgroundColor = .darkGray
        }
    }
    
    
    
    lazy var lineChartView:LineChartView = {
        let lineChartView = LineChartView.init(frame: CGRect.init(x: 0, y: 20, width: 300, height: 250));
        lineChartView.delegate = self;
        //        lineChartView.backgroundColor = UIColor.init(red: 230/255.0, green: 253/255.0, blue: 253/255.0, alpha: 1.0);
        lineChartView.doubleTapToZoomEnabled = false;
        lineChartView.scaleXEnabled = false;
        lineChartView.scaleYEnabled = false;
        lineChartView.chartDescription?.text = "current";
        
        lineChartView.noDataText = "no data";
        lineChartView.noDataTextColor = UIColor.gray;
        lineChartView.noDataFont = UIFont.boldSystemFont(ofSize: 14);
        
        
        lineChartView.rightAxis.enabled = false;
        let leftAxis = lineChartView.leftAxis;
        leftAxis.labelCount = 10;
        leftAxis.forceLabelsEnabled = false;
        leftAxis.axisLineColor = UIColor.black;
        leftAxis.labelTextColor = UIColor.black;
        leftAxis.labelFont = UIFont.systemFont(ofSize: 10);
        leftAxis.labelPosition = .outsideChart;
        leftAxis.gridColor = UIColor.init(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1.0);//
        
        leftAxis.gridAntialiasEnabled = true;
        leftAxis.axisMaximum = 60;
        leftAxis.axisMinimum = 20;
        leftAxis.labelCount = 15;
        
        
        let xAxis = lineChartView.xAxis;
        xAxis.granularityEnabled = true;
        xAxis.labelTextColor = UIColor.black;
        xAxis.labelFont = UIFont.systemFont(ofSize: 10.0);
        xAxis.labelPosition = .bottom;
        xAxis.gridColor = UIColor.init(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1.0);
        xAxis.axisLineColor = UIColor.black;
        xAxis.labelCount = 12;
        return lineChartView;
    }()
    
    func drawLineChart(){
        self.addLimitLine(45, "Limited line");
        let xValues = ["1","2","3","4","5","6","7","8","9","10","11","12"];
        lineChartView.xAxis.valueFormatter = VDChartAxisValueFormatter.init(xValues as NSArray);
        lineChartView.leftAxis.valueFormatter = VDChartAxisValueFormatter.init();
        
        var yDataArray1 = [ChartDataEntry]();
        for i in 0...xValues.count-1 {
            let y = 30 + arc4random()%30;
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y));
            
            yDataArray1.append(entry);
        }
        let set1 = LineChartDataSet.init(values: yDataArray1, label: "MPPT(A)");
        set1.colors = [UIColor.orange];
        set1.drawCirclesEnabled = false
        set1.lineWidth = 1.0;
        
        var yDataArray2 = [ChartDataEntry]();
        for i in 0...xValues.count-1 {
            let y = 30 + arc4random()%30;
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y));
            
            yDataArray2.append(entry);
        }
        let set2 = LineChartDataSet.init(values: yDataArray2, label: "Barrtry(A)");
        set2.colors = [UIColor.green];
        set2.drawCirclesEnabled = false;
        set2.lineWidth = 1.0;
        
        let data = LineChartData.init(dataSets: [set1,set2]);
        
        lineChartView.data = data;
        lineChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBack);
    }
    
    func addLimitLine(_ value:Double, _ desc:String) {
        let limitLine = ChartLimitLine.init(limit: value, label: desc);
        
        limitLine.lineWidth = 1;
        limitLine.lineColor = UIColor.red;
        limitLine.lineDashLengths = [2.0,2.0];
        
        limitLine.valueFont = UIFont.systemFont(ofSize: 10.0);
        limitLine.valueTextColor = UIColor.black;
        limitLine.labelPosition = .rightBottom;
        lineChartView.leftAxis.addLimitLine(limitLine);
    }
    
    func showMarkerView(_ value: String) {
        let marker = MarkerView.init(frame: CGRect.init(x: 20, y: 20, width: 60, height: 20));
        marker.chartView = lineChartView;
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 20));
        label.text = value;
        label.textColor = UIColor.white;
        label.font = UIFont.systemFont(ofSize: 12);
        label.backgroundColor = UIColor.gray;
        label.textAlignment = .center;
        marker.addSubview(label);
        lineChartView.marker = marker;
        
    }
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        self.showMarkerView("\(entry.y)");
    }
    
    
    lazy var pieChartView: PieChartView = {
        let pieChartView = PieChartView.init(frame: CGRect.init(x: 0, y: 20, width: 340, height: 340));
        //        pieChartView.backgroundColor = UIColor.init(red: 230/255.0, green: 253/255.0, blue: 253/255.0, alpha: 1.0);
        pieChartView.setExtraOffsets(left: 40, top: 10, right: 40, bottom: 30);
        pieChartView.chartDescription?.text = "Battry Status";
        pieChartView.chartDescription?.font = UIFont.systemFont(ofSize: 12.0);
        pieChartView.chartDescription?.textColor = UIColor.black;
        
        pieChartView.usePercentValuesEnabled = true;
        pieChartView.dragDecelerationEnabled = true;
        pieChartView.drawEntryLabelsEnabled = true;
        pieChartView.entryLabelFont = UIFont.systemFont(ofSize: 10);//区块文本的字体
        pieChartView.entryLabelColor = UIColor.white;
        pieChartView.drawSlicesUnderHoleEnabled = true;
        
        
        pieChartView.drawHoleEnabled = true
        pieChartView.holeRadiusPercent = 0.382
        pieChartView.holeColor = UIColor.white;
        pieChartView.transparentCircleRadiusPercent = 0.7;
        
        pieChartView.drawCenterTextEnabled = true
        pieChartView.centerText = "Battry";
        
        //图例样式设置
        pieChartView.legend.maxSizePercent = 1;
        pieChartView.legend.form = .circle//图示：原、方、线
        pieChartView.legend.formSize = 16;//图示大小
        pieChartView.legend.formToTextSpace = 4;//文本间隔
        pieChartView.legend.font = UIFont.systemFont(ofSize: 8);
        pieChartView.legend.textColor = UIColor.gray;
        pieChartView.legend.horizontalAlignment = .left;
        pieChartView.legend.verticalAlignment = .top;
        
        pieChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBack);
        
        return pieChartView;
    }()
    
    func drawPieChartView() {
        //        let titles = ["红","黄","蓝色","橙","绿"];
        //        let yData = [20,30,10,40,60];
        
        let titles = ["Charging",""];
        let yData = [90,10];
        var yVals = [PieChartDataEntry]();
        for i in 0...titles.count-1 {
            let entry = PieChartDataEntry.init(value: Double(yData[i]), label: titles[i]);
            yVals.append(entry);
        }
        
        let dataSet = PieChartDataSet.init(values: yVals, label: "");
        // dataSet.colors = [UIColor.red,UIColor.yellow,UIColor.blue,UIColor.orange,UIColor.green];
        dataSet.colors = [UIColor.green,UIColor.gray];
        
        dataSet.xValuePosition = .insideSlice;
        dataSet.yValuePosition = .outsideSlice;
        dataSet.sliceSpace = 1;
        dataSet.selectionShift = 6.66;
        
        dataSet.valueLinePart1OffsetPercentage = 0.8 //折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
        dataSet.valueLinePart1Length = 0.8 //折线中第一段长度占比
        dataSet.valueLinePart2Length = 0.4 //折线中第二段长度最大占比
        dataSet.valueLineWidth = 1 //折线的粗细
        dataSet.valueLineColor = UIColor.brown //折线颜色
        
        let data = PieChartData.init(dataSets: [dataSet]);
        data.setValueFormatter(VDChartAxisValueFormatter2.init());//格式化值（添加个%）
        data.setValueFont(UIFont.systemFont(ofSize: 10.0));
        data.setValueTextColor(UIColor.lightGray);
        pieChartView.data = data;
        
    }
    
}

class VDChartAxisValueFormatter: NSObject,IAxisValueFormatter {
    var values:NSArray?;
    override init() {
        super.init();
    }
    init(_ values: NSArray) {
        super.init();
        self.values = values;
    }
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if values == nil {
            return "\(value)";
        }
        return values?.object(at: Int(value)) as! String;
    }
}


class VDChartAxisValueFormatter2: NSObject,IValueFormatter {
    var values:NSArray?;
    override init() {
        super.init();
    }
    init(_ values: NSArray) {
        super.init();
        self.values = values;
    }
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String.init(format: "%.2f%%", value);
    }
}









