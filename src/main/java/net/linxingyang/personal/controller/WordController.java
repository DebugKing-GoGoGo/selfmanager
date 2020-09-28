package net.linxingyang.personal.controller;import net.linxingyang.common.utils.LightPageBean;import net.linxingyang.common.vo.CommonVo;import net.linxingyang.common.vo.ResponseCode;import net.linxingyang.personal.exception.PersonalException;import net.linxingyang.personal.pojo.Word;import net.linxingyang.personal.qo.WordQo;import net.linxingyang.personal.service.WordService;import net.linxingyang.personal.vo.WordVo;import org.slf4j.Logger;import org.slf4j.LoggerFactory;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.ResponseBody;@Controller@RequestMapping(value="word")public class WordController {    private static Logger log = LoggerFactory.getLogger(WordController.class);    @Autowired    private WordService wordService;    @RequestMapping("/queryWord")    public @ResponseBody CommonVo queryWord(Integer id) {        CommonVo vo = new CommonVo();                try {            vo.setResultObject(wordService.selectVoById(id));            vo.setCode(ResponseCode.SUCCESS);            vo.setMessage("查询一些话成功!");        } catch (PersonalException e) {            vo.setCode(ResponseCode.ERROR_INPUT);            vo.setMessage(e.getMessage());            log.info("查询一些话失败：" + vo.getCode() + ":" + e.getMessage());        } catch (Exception e) {            vo.setCode(ResponseCode.INTERNAL_ERROR);            vo.setMessage("内部错误!");            log.info("查询一些话失败：" + vo.getCode() + "：" + e.getMessage());        }        return vo;    }        /**     * 更新一些话     *      * @param word     * @return     */    @RequestMapping("/modifyWord")    public @ResponseBody CommonVo modifyWord(Word word) {        CommonVo vo = new CommonVo();                try {            wordService.update(word);            vo.setCode(ResponseCode.SUCCESS);            vo.setMessage("更新一些话成功!");            log.info("更新一些话成功");        } catch (PersonalException e) {            vo.setCode(ResponseCode.ERROR_INPUT);            vo.setMessage(e.getMessage());            log.info("更新一些话失败：" + vo.getCode() + ":" + e.getMessage());        } catch (Exception e) {            vo.setCode(ResponseCode.INTERNAL_ERROR);            vo.setMessage("内部错误!");            log.info("更新一些话失败：" + vo.getCode() + "：" + e.getMessage());        }        return vo;    }            /**     * 查询一些话列表     *      * @param qo     * @return     */    @RequestMapping("/listWord")    public @ResponseBody LightPageBean<WordVo> listTask(WordQo qo) {    	System.out.println(qo);    	    	LightPageBean<WordVo> vo = new LightPageBean<WordVo>();     	try {    		// vo = diaryService.selectByQo2(qo);    		vo = wordService.selectByQo2(qo);    		vo.setCode(ResponseCode.SUCCESS);    		vo.setMsg("查询任务成功!");    	} catch (PersonalException e) {    		vo.setCode(ResponseCode.ERROR_INPUT);    		vo.setMsg(e.getMessage());    		log.info("查询任务失败：" + vo.getCode() + ":" + e.getMessage());		} catch (Exception e) {			vo.setCode(ResponseCode.INTERNAL_ERROR);			vo.setMsg("内部错误!");			log.info("查询任务失败：" + vo.getCode() + "：" + e.getMessage());		}    	return vo;    }        /**     * 添加一些话     *      * @param word 一些话     * @return CommonVo 处理结果     */    @RequestMapping("/addWord")    public @ResponseBody CommonVo addTask(Word word) {        CommonVo vo = new CommonVo();                try {            wordService.insert(word);            vo.setCode(ResponseCode.SUCCESS);            vo.setMessage("添加一些话成功!");            log.info("添加一些话成功");        } catch (PersonalException e) {            vo.setCode(ResponseCode.ERROR_INPUT);            vo.setMessage(e.getMessage());            log.info("添加一些话失败：" + vo.getCode() + ":" + e.getMessage());        } catch (Exception e) {            vo.setCode(ResponseCode.INTERNAL_ERROR);            vo.setMessage("内部错误!");            log.info("添加一些话失败：" + vo.getCode() + "：" + e.getMessage());        }        return vo;    }}