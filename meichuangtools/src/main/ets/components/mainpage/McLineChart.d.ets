import { InterfaceObj } from '../../utils/chartInterface';
@Component
export declare struct McLineChart {
    private settings;
    private context;
    @State
    options: InterfaceObj;
    @State
    isTooltipShow: boolean;
    @State
    tooltipInfo: InterfaceObj;
    showInfo(flag: any, pos?: any, title?: any, arr?: any, tooltipInfo?: any): void;
    aboutToAppear(): void;
    build(): void;
}
