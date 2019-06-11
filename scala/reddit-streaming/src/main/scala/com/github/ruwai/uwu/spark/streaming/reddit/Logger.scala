package com.github.ruwai.uwu.spark.streaming.reddit

import org.apache.log4j.LogManager

trait Logger {
  @transient private lazy val log = LogManager.getLogger("lib-reddit")

  def logDebug(message: String): Unit = log.debug(message)
  def logInfo(message: String): Unit = log.info(message)
  def logError(message: String): Unit = log.error(message)
  def logError(message: String, throwable: Throwable): Unit = log.error(message, throwable)
}